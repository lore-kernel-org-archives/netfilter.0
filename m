From: CeR <cer.inet@linuxmail.org>
Subject: assuming valid ESTABLISHED connections without conntrack on firewall
 active/pasive HA cluster
Date: Wed, 18 May 2011 21:05:40 +0200
Message-ID: <BANLkTikr64Kj+yw_3Pq0WWO_mG=vtZ9eTA@mail.gmail.com>
References: <BANLkTinsDigkLBwM+FFrWev-6WRvsVe4GQ@mail.gmail.com>
 <4DD2FB01.9080709@netfilter.org> <BANLkTikUizSTeLOg5OjA0Sa-QiXk2mv_nw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:from
         :date:x-google-sender-auth:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=wHc0ILX2Jo9SP9ZaRL7hAlxjBM902MHBA/UKVRQD+3c=;
        b=vDFCMz5rOJDXOx0Peu1cSYm3Rgeo0yN3wBv40KHJRZi0zpZ49eNhfY8n3KJ8tST6XN
         o6SBhY8F5zAAbA08MU14Tt6c3A159R9tWTer3i2+9KUBJ3saboGI5uhNpTol5ydel/Ns
         CSSQNi3RIn8v3fKQeN84CS3js/bBgOPEQIrvI=
In-Reply-To: <BANLkTikUizSTeLOg5OjA0Sa-QiXk2mv_nw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi there,
It's seems that I wasn't using the needed modules. Typical human error.
-----------------
root@fw2:~# cat /proc/sys/net/netfilter/nf_conntrack_tcp_loose
cat: /proc/sys/net/netfilter/nf_conntrack_tcp_loose: No existe el
fichero o el directorio
root@fw2:~# modprobe nf_conntrack_ipv4
root@fw2:~# cat /proc/sys/net/netfilter/nf_conntrack_tcp_loose
1
root@fw2:~#
----------------
Avoiding mistakes by editing /etc/modules:
----------------
root@fw2:~# cat /etc/modules | grep nf
nf_conntrack
nf_conntrack_ipv4
nf_conntrack_netlink
nfnetlink
nf_defrag_ipv4
-----------------

My kernel (debian squeeze):
----------------
root@fw2:~# uname -r
2.6.32-5-amd64
-----------------
And now I'm applying the IRC suggestion:
-----------------
root@fw2:~# cat /etc/sysctl.conf | grep nf_conntrack_tcp_loose
net.netfilter.nf_conntrack_tcp_loose =3D 0
------------------
Thanks you.


2011/5/18 Pablo Neira Ayuso <pablo@netfilter.org>
>
> Hi,
>
> On 12/05/11 19:15, CeR wrote:
> > Hi there.
> > I'm working on a active/pasive HA cluster with corosync/pacemaker.
> > For testing purposes, i did these test:
> >
> > CASE A: One of that test do the next:
> >
> > 1) Initialisation of a connection with a big file transfer with SCP
> > across the cluster.
> > 2) "halt" the primary node. All resources (pacemaker) moves to anot=
her
> > node. That's ok.
> > 3) The file transfer still working. Transparent to the end user.
> >
> > CASE B: I want to be sure that the failback/failover is thanks to
> > conntrackd flow's-state-replication, so
> >
> > 1) Stop the conntrackd resource. All go fine. Conntrack is not work=
ing any more.
> > 2) Start the file transfer across the cluster.
> > 3) Failover the node that has the IPVs. All resources moves to anot=
her
> > node (pacemaker).
> > 4) The file transfer still working. Transparent to the end user.
> > =E7=9C=9F=E7=9C=9F=E7=9C=9F?????? WTF
>
> That's completely possible in several cases:
>
> * your rule-set is not stateful.
> * your stateful rule-set is malformed.
> * you forget to enable strict tracking.
>
> Your testcases A and B are a good idea indeed, because you can really
> test if you configured conntrackd correctly.
>
> > In the CASE B, without the conntrackd running, I supposed that the =
new
> > node being owner of IPVs will not have any knowlege about the state=
 of
> > the flow (you know, NEW, ESTABLISHED,etc..). And this mean the
> > firewall has to block the transference.
> > But still transfering and the iptables rule being aplied as it wher=
e
> > an ESTABLISHED connection:
> >
> > Chain FORWARD (policy DROP 42 packets, 3336 bytes)
> > =C2=A0pkts bytes target =C2=A0 =C2=A0 prot opt in =C2=A0 =C2=A0 out=
 =C2=A0 =C2=A0 source
> > destination
> > =C2=A0741K 1075M ACCEPT =C2=A0 =C2=A0 tcp =C2=A0-- =C2=A0eth0 =C2=A0=
 eth2 =C2=A0 =C2=A010.0.0.128
> > 192.168.100.100 =C2=A0 =C2=A0 tcp spts:1024:65535 dpt:22 state NEW,=
ESTABLISHED
> > 37498 2400K ACCEPT =C2=A0 =C2=A0 tcp =C2=A0-- =C2=A0eth2 =C2=A0 eth=
0 =C2=A0 =C2=A0192.168.100.100
> > 10.0.0.128 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcp spt:22 dpts:1024:6=
5535 state ESTABLISHED
> >
> > Any idea? Is this the standard behaviour of netfilter tools?
> >
> > In the IRC channel, i got this:
> > [18:32] <fw> sysctl net.netfilter.nf_conntrack_tcp_loose
> > [18:33] <fw> its probably one. =C2=A0it must be 0 to disable pickup=
 of
> > established connections.
>
> Yes, this is indeed a good clue.
>
> > But in fact, i haven' t "net.netfilter.nf_conntrack_tcp_loose" nor
> > "net.ipv4.netfilter.ip_conntrack_tcp_loose"
>
> What kernel version are you using? If it's too old you may find
> net.ipv4.netfilter.ip_conntrack_loose instead.
>
> Here it is:
>
> # ls /proc/sys/net/netfilter/nf_conntrack_tcp_loose
> /proc/sys/net/netfilter/nf_conntrack_tcp_loose
> # uname -a
> Linux 2.6.39-rc2-09922-g0f08190 #58 SMP PREEMPT Sun May 15 17:35:57 C=
EST
> 2011 i686 GNU/Linux
> # lsmod | grep nf_conntrack
> nf_conntrack_netlink =C2=A0 =C2=A013579 =C2=A00
> nfnetlink =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2086 =C2=A0=
7 nfnetlink_log,nf_conntrack_netlink
> nf_conntrack_ipv4 =C2=A0 =C2=A0 =C2=A0 8841 =C2=A00
> nf_conntrack =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 45970 =C2=A02 nf_conn=
track_netlink,nf_conntrack_ipv4
> nf_defrag_ipv4 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 867 =C2=A01 nf_conn=
track_ipv4
>
> Please, take the time to read the documentation:
>
> http://conntrack-tools.netfilter.org/testcase.html
> http://conntrack-tools.netfilter.org/manual.html
>
> Thanks.



--
/* Arturo Borrero Gonzalez || cer.inet@linuxmail.org */
/* Use debian gnu/linux! Best OS ever! */
