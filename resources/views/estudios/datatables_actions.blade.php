{!! Form::open(['route' => ['estudios.destroy', $id], 'method' => 'delete']) !!}
<div class='btn-group'>
    <a href="{{ route('estudios.show', $id) }}" class='btn btn-default btn-xs'>
        <i class="glyphicon glyphicon-eye-open"></i>
    </a>
    <a href="{{ route('estudios.edit', $id) }}" class='btn btn-default btn-xs'>
        <i class="icon ion-edit"></i>
    </a>
    {!! Form::button('<i class="glyphicon glyphicon-trash"></i>', [
        'type' => 'submit',
        'class' => 'btn btn-danger btn-xs',
        'onclick' => "return confirm('Confirma que desea eliminar?')"
    ]) !!}
</div>
{!! Form::close() !!}
