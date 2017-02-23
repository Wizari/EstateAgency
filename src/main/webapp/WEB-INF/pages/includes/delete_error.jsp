<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div id="delete-error" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Error</h4>
            </div>
            <div class="modal-body">
                <p>Deleting is not possible. Entity has dependencies.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>


<c:if test="${delete_error}">
    <script type="application/javascript">

        $(document).ready(function () {
            $("#delete-error").modal("show");
        });

    </script>
</c:if>