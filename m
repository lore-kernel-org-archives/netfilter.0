From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Redirecting ports - not working
Date: Fri, 18 Jul 2003 07:54:31 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0192C1@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: =?iso-8859-1?Q?Andr=E9_Aun?= <andre_aun@terra.com.br>, netfilter@lists.netfilter.org

The magic word, "virtual machine"..

I heard there was a special thing that needs to be done for virtual =
machines which was nothing to do with netfilter/iptables. Can't remember =
where I saw this info a while back..

Refer to VMWARE or whatever virtual machine software your using because =
it's probably that.

Otherwise the only thing I can suggest is logging all forwarded traffic =
on port 80 and watch it to be 100% sure it's not iptables, then refer to =
the VM software...


Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

