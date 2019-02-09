from django.db import models

# Create your models here.

class Post(models.Model):
    title = models.CharField(max_length=100)
    url = models.CharField(max_length=150)
    content = models.TextField()


class Cliente(models.Model):
    cliente_id = models.AutoField(primary_key=True)
    cliente_nomb = models.CharField(max_length=30)
    tcliente = models.ForeignKey('ClienteTipo', models.DO_NOTHING)
    carrera = models.CharField(db_column='Carrera', max_length=30)  # Field name made lowercase.
    estado = models.CharField(max_length=30)

    class Meta:
        managed = False
        db_table = 'cliente'


class ClienteTipo(models.Model):
    tcliente_id = models.AutoField(primary_key=True)
    tcliente_nomb = models.CharField(max_length=30)

    class Meta:
        managed = False
        db_table = 'cliente_tipo'


class Empleado(models.Model):
    emp_id = models.AutoField(primary_key=True)
    emp_nomb = models.CharField(max_length=30)
    cedula = models.IntegerField()
    tanda_labor = models.ForeignKey('TandaLabor', models.DO_NOTHING)
    fecha_registro = models.CharField(max_length=30)
    estado = models.CharField(max_length=30)

    class Meta:
        managed = False
        db_table = 'empleado'


class FormaPago(models.Model):
    forma_pago_id = models.AutoField(primary_key=True)
    forma_pago_descrip = models.CharField(max_length=30)
    forma_pago_estado = models.CharField(max_length=30)

    class Meta:
        managed = False
        db_table = 'forma_pago'


class RegistroMovimiento(models.Model):
    no_movimiento = models.AutoField(primary_key=True)
    emp = models.ForeignKey(Empleado, models.DO_NOTHING)
    cliente = models.ForeignKey(Cliente, models.DO_NOTHING)
    servicio_fact = models.ForeignKey('ServicioFacturable', models.DO_NOTHING)
    tipo_doc = models.ForeignKey('TipoDocumento', models.DO_NOTHING)
    forma_pago = models.ForeignKey(FormaPago, models.DO_NOTHING)
    fecha_movimiento = models.CharField(max_length=30)
    monto = models.FloatField()
    estado = models.CharField(max_length=30)

    class Meta:
        managed = False
        db_table = 'registro_movimiento'


class ServicioFacturable(models.Model):
    servicio_fact_id = models.AutoField(primary_key=True)
    servicio_fact_descrip = models.CharField(max_length=30)
    servicio_fact_estado = models.CharField(max_length=30)

    class Meta:
        managed = False
        db_table = 'servicio_facturable'


class TandaLabor(models.Model):
    tanda_labor_id = models.AutoField(primary_key=True)
    tanda_labor_nomb = models.CharField(max_length=30)

    class Meta:
        managed = False
        db_table = 'tanda_labor'


class TipoDocumento(models.Model):
    tipo_doc_id = models.AutoField(primary_key=True)
    tipo_doc_descrip = models.CharField(max_length=30)
    tipo_doc_estado = models.CharField(max_length=30)

    class Meta:
        managed = False
        db_table = 'tipo_documento'