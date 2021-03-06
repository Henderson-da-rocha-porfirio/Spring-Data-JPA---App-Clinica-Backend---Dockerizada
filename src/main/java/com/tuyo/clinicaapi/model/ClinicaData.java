package com.tuyo.clinicaapi.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "clinicadata")                                        // Utilizado porque o nome do objeto ClinicaData é diferente do nome da tabela clinicadata que está no database
@JsonIgnoreProperties({"paciente"})                                 // Utilizar @JsonIgnoreProperties, para que esta informação paciente seja ignorada pela serialização ocorrida em ClinicaData.
public class ClinicaData {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)             //Esse ID é um campo auto-incremento no Database. Então por isso precisamos indicar isso ao Hibernate usando o @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;                                                 // Contudo, será criado no Database sem problemas. Mas o ID quando retornar ao Client (database), ele será zerado automaticamente, e o Hibernate não pegará o valor do Database.
    @Column(name = "componente_nome")
    private String componenteNome;                                  // @GeneratedValue(strategy = GenerationType.IDENTITY) também precisa ser adicionado ao Paciente.
    @Column(name = "componente_value")
    private String componenteValue;
    @Column(name = "measured_date_time")
    private Timestamp MeasuredDateTime;
    @ManyToOne(fetch = FetchType.LAZY)                                // Estamos lendo os dados de Paciente através de ClinicaData
    @JoinColumn(name = "paciente_id",nullable = false)               // Tabela responsável pelo Join
    @JsonIgnore                                                      // Necessário colocar o JsonIgnore. OU do contrário fará " loop infinito " porque Paciente está retornado de Paciente de PacienteController no final do método analise.
    private Paciente paciente;                                      // JsonIgnore serializa paciente e acha ClinicaData. Ele então também serializa ClinicaData dentro de ClinicaData. E por isso que o loop nunca acontecerá.
                                                                    // Tudo isso está assegurando que quando estou salvando o dado, a validação de ClinicaData acontece corretamente no nível JPA.
                                                                    // Algumas exceções podem acontecer se eu tentar injetar clinicaldata sem o ID do Paciente.
                                                                    // Quando a serialização acontece, ela fica num loop terntando serializar o dado paciente.
                                                                    // Para resolver isso, derveríamos ignorar colocando " transient " dessa forma: private transient Paciente paciente;
    public int getId() {                                            // Mas aqui foi escolhido utilizar @JsonIgnoreProperties. Para que esta informação paciente seja ignorada. Verificar acima.
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getComponenteNome() {
        return componenteNome;
    }

    public void setComponenteNome(String componenteNome) {
        this.componenteNome = componenteNome;
    }

    public String getComponenteValue() {
        return componenteValue;
    }

    public void setComponenteValue(String componenteValue) {
        this.componenteValue = componenteValue;
    }

    public Timestamp getMeasuredDateTime() {
        return MeasuredDateTime;
    }

    public void setMeasuredDateTime(Timestamp measuredDateTime) {
        MeasuredDateTime = measuredDateTime;
    }

    public Paciente getPaciente() {
        return paciente;
    }

    public void setPaciente(Paciente paciente) {
        this.paciente = paciente;
    }
}
