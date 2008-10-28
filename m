From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: [PATCH 3/7] netns ebtables: more cleanup during
	ebt_unregister_table()
Date: Tue, 28 Oct 2008 23:59:48 +0300
Message-ID: <20081028205948.GE15660@x200.localdomain>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:mime-version:content-type:content-disposition:user-agent;
        bh=foE9cDv1pCIthHArXyTGQHi53uMlA+U/oUOQRkQBOOQ=;
        b=SztLsnGRH5Wk47d3CUta8iOedIBNNwU5HEg3ZMkN8EqMBXgqsX8j1HbyxE5//aZKvn
         tcwnneUxqCV4v1RGff2NOk74+qMIFnlDPm1dJuYz/O6hu8zXhgj+AHMfPdXA5gd91q6V
         MNrkB06Y3Ej71mMMZuPM3R1f4c1hA77Flt1NQ=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kaber@trash.net
Cc: netfilter@vger.kernel.org, containers@osdl.org

Now that ebt_unregister_table() can be called during netns stop, and module
pinning scheme can't prevent netns stop, do table cleanup by hand.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 net/bridge/netfilter/ebtables.c |    4 ++++
 1 file changed, 4 insertions(+)

--- a/net/bridge/netfilter/ebtables.c
+++ b/net/bridge/netfilter/ebtables.c
@@ -1209,6 +1209,10 @@ void ebt_unregister_table(struct ebt_table *table)
 	mutex_lock(&ebt_mutex);
 	list_del(&table->list);
 	mutex_unlock(&ebt_mutex);
+	EBT_ENTRY_ITERATE(table->private->entries, table->private->entries_size,
+			  ebt_cleanup_entry, NULL);
+	if (table->private->nentries)
+		module_put(table->me);
 	vfree(table->private->entries);
 	if (table->private->chainstack) {
 		for_each_possible_cpu(i)
