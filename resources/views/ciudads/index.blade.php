@extends('layouts.app')

@section('content')
    <section class="content-header">
        <h1 class="pull-left">Ciudades</h1>
        <h1 class="pull-right">
           <a class="btn btn-default pull-right" style="margin-top: -10px;margin-bottom: 5px" href="{!! route('ciudads.create') !!}"><i class="fa fa-plus" aria-hidden="true"></i>Agregar Ciudad</a>
        </h1>
    </section>
    <div class="content">
        <div class="clearfix"></div>

        {!! Alert::render() !!}

        <div class="clearfix"></div>
        <div class="box box-primary">
            <div class="box-body">
                    @include('ciudads.table')
            </div>
        </div>
    </div>
@endsection
