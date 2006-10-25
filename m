From: <anisha.chandrasekaran@wipro.com>
Subject: RE: understanding how conntrack works
Date: Wed, 25 Oct 2006 08:44:27 +0530
Message-ID: <2FEE63312285CF428A8480B07AC1C35903657F21@CHN-SNR-MBX01.wipro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: alan.ezust@presinet.com, netfilter@lists.netfilter.org


Hello all,
     Alan, I jus read your below mail regarding the conntrack facility.
I am sorry that I am not able to help you with an answer to your query.
I am actually writing this mail to ask you if you could help me know
what are the structures that store conntrack details, i.e, if I want to
drop a particular connection that is established which structure entry I
should be parsing and deleting??????
     Since I am also doing an analysis on the kernel code for conntrack
facility I thought you may be able to help me out...

=0D
 Regards,

Anisha Chandrasekaran
Email : anisha.chandrasekaran@wipro.com =0D
 =0D
        =0D

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Alan Ezust
Sent: Monday, October 23, 2006 11:49 PM
To: netfilter@lists.netfilter.org
Subject: understanding how conntrack works

Greetings all, I'm exploring the kernel source trying to understand
better how=0D
the conntrack facility works. I had a couple of questions which I hope=0D
someone more familiar with the code can answer...

Q: Where in the code does a table entry get added to the conntrack
table?=0D
nf_conntrack_put doesn't seem to contain much code related to that.

Q: Where in the code is the conntrack data lines being written, and
using what=0D
mechanism? (kprintf? procfs?)

I did some ctags jumping and keep coming to the nf_conntrack_put
function,=0D
which I expected to contain the code. Instead it only contains a

<pre>
// ip_conntrack.h:
static inline void
ip_conntrack_put(struct ip_conntrack *ct)
{
	IP_NF_ASSERT(ct);
	nf_conntrack_put(&ct->ct_general);
}

// skbuff.h:
#ifdef CONFIG_NETFILTER
static inline void nf_conntrack_put(struct nf_conntrack *nfct)
{
	if (nfct && atomic_dec_and_test(&nfct->use))
		nfct->destroy(nfct);
}
</pre>

The "destroy" call is an indirect function call, which appears to be a
call=0D
(most of the time) to nf_conntrack_core.c:541
<pre>
static void destroy_conntrack(struct nf_conntrack *nfct)
</pre>

I hope the table updating and kprintf lines are not embedded within the=0D
destroy code?

Q: What is "master"?

It seems that conntrack data has a concept called "master". When a
connection=0D
is "destroyed", a call to the "master" destroy is also made. What is the

relationship between the nf_conntrack and the master of an nf_conntrack=0D
(appears to be a tree or a linked list). It seems to be an ownership=0D
relationship.





The information contained in this electronic message and any attachments to=
 this message are intended for the exclusive use of the addressee(s) and=
 may contain proprietary, confidential or privileged information. If you=
 are not the intended recipient, you should not disseminate, distribute or=
 copy this e-mail. Please notify the sender immediately and destroy all=
 copies of this message and any attachments.=0D

WARNING: Computer viruses can be transmitted via email. The recipient=
 should check this email and any attachments for the presence of viruses.=
 The company accepts no liability for any damage caused by any virus=
 transmitted by this email.
=0D
www.wipro.com

