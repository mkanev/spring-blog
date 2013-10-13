<h2>Tags</h2>

<a href="${contextPath}/admin/tags/new"><button class="btn btn-info"><span class="glyphicon glyphicon-plus-sign"></span> New Tag</button></a>
<br/><br/>
<c:choose>
    <c:when test="${fn:length(tags) > 0}">
        <table class="table table-striped">
            <tr>
                <th>Tag</th>
                <th>Count</th>
                <th></th>
            </tr>
            <c:forEach items="${tags}" var="tag">
                <tr>
                    <td>${tag.tagName}</td>
                    <td>${tagCounts.get(tag.tagId)}</td>
                    <td><a onclick="deleteTag('${tag.tagId}')" title="Delete tag."><button class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></button></a></td>
                </tr>
            </c:forEach>
        </table>
    </c:when>
    <c:otherwise>
        No tags available.
    </c:otherwise>
</c:choose>

<script type="text/javascript">

    function deleteTag(id){
        if (confirm("Are you sure you want to delete this tag?")){
            $.ajax({
                type: "POST",
                url: "${contextPath}/admin/delete/tags/" + id,
            }).done(function(data){
                alert(data);
                location.reload();
            });
        }
    }

</script>