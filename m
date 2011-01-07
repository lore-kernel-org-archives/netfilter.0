From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: ulogd2 segfault
Date: Fri, 07 Jan 2011 14:37:11 +0100
Message-ID: <4D271707.60407@netfilter.org>
References: <4D1E0374.3090008@open.ch> <4D221173.3060009@open.ch> <4D25C945.7030502@netfilter.org> <4D26E9C0.9090304@open.ch>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070705070309060004080300"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D26E9C0.9090304@open.ch>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: =?ISO-8859-1?Q?Salih_G=F6n=FCll=FC?= <sag@open.ch>
Cc: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------070705070309060004080300
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On 07/01/11 11:24, Salih G=F6n=FCll=FC wrote:
> On 01/06/2011 02:53 PM, Pablo Neira Ayuso wrote:
>=20
>> Let me check this, if the problem is what you're pointing (which makes
>> sense at first look at the code) I guess that we need some refcounting
>> for plugins to avoid double freeing.
>=20
>=20
> When I comment out nflog_unbind_group(ui->nful_gh) in  stop() inside
> input/packet/ulogd_inppkt_NFLOG.c,  ulogd does not segfault anymore.
>=20
> Here I have question:
>=20
> Does  *pi in
> static int stop(struct ulogd_pluginstance *pi)
>=20
> represent the NFLOG plugin or the individual log2:NFLOG ? I am asking
> because it get started only once with pluginstance_started(), and
> therefore should be stopped once (?)

Indeed, accurate analysis. Would you give a try to the following patch?

--------------070705070309060004080300
Content-Type: text/x-patch;
 name="refcount.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="refcount.patch"

ulogd: fix double call of stop for reused input plugins

From: Pablo Neira Ayuso <pablo@netfilter.org>

This patch adds reference counting for plugins. This is used to fix
a double stop for input plugins that are reused.

This problem was reported by Salih Gonullu <sag@open.ch>:

http://marc.info/?l=netfilter&m=129439584700693&w=2

Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
---
 include/ulogd/ulogd.h |    2 ++
 src/ulogd.c           |   14 ++++++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/ulogd/ulogd.h b/include/ulogd/ulogd.h
index 2d1b348..e48caf8 100644
--- a/include/ulogd/ulogd.h
+++ b/include/ulogd/ulogd.h
@@ -208,6 +208,8 @@ struct ulogd_plugin {
 	char name[ULOGD_MAX_KEYLEN+1];
 	/* ID for this plugin (dynamically assigned) */
 	unsigned int id;
+	/* how many stacks are using this plugin? initially set to zero. */
+	unsigned int usage;
 
 	struct ulogd_keyset input;
 	struct ulogd_keyset output;
diff --git a/src/ulogd.c b/src/ulogd.c
index f378c6f..a4b0ed1 100644
--- a/src/ulogd.c
+++ b/src/ulogd.c
@@ -762,6 +762,15 @@ static int pluginstance_started(struct ulogd_pluginstance *npi)
 	return 0;
 }
 
+static int pluginstance_stop(struct ulogd_pluginstance *npi)
+{
+	if (--npi->plugin->usage > 0 &&
+	    npi->plugin->input.type == ULOGD_DTYPE_SOURCE) {
+		return 0;
+	}
+	return 1;
+}
+
 static int create_stack_start_instances(struct ulogd_pluginstance_stack *stack)
 {
 	int ret;
@@ -839,6 +848,7 @@ static int create_stack(const char *option)
 			ret = -ENODEV;
 			goto out;
 		}
+		pl->usage++;
 
 		/* allocate */
 		pi = pluginstance_alloc_init(pl, pi_id, stack);
@@ -989,8 +999,8 @@ static void stop_pluginstances()
 
 	llist_for_each_entry(stack, &ulogd_pi_stacks, stack_list) {
 		llist_for_each_entry_safe(pi, npi, &stack->list, list) {
-			if (((pi->plugin->priv_size == 0) || pi->private[0])
-					&& *pi->plugin->stop) {
+			if ((pi->plugin->priv_size > 0 || *pi->plugin->stop) &&
+			    pluginstance_stop(pi)) {
 				ulogd_log(ULOGD_DEBUG, "calling stop for %s\n",
 					  pi->plugin->name);
 				(*pi->plugin->stop)(pi);

--------------070705070309060004080300--
