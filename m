From: "Antonio Paulo Salgado Forster" <aforster@br.ibm.com>
Subject: Re: nmap
Date: Tue, 22 Oct 2002 16:19:28 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF82B207AC.47A157E9-ON03256C5A.0069B126@LocalDomain>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org


I  had problems on scanning through netfilter depending on the kind of scan
you run.. One of the problems you may face in case you run a ACK scan from
a segment that has the permition for the traffic, you will have your
conntrack full in a few seconds with ESTABLISHED connections that will take
long to disappear.. The same will happen when portscanning from the
firewall box with a default policy for OUTPUT set as ACCEPT.

One of the ways to fix this is to increase the size of the conntrack.. I
use to do that when creating the box by changing the source code and
recompiling the kernel... but I dont know if there are any side effects on
doing that..

--Regards,

Forster




Antony Stone <Antony@Soft-Solutions.co.uk>@lists.netfilter.org on
10/22/2002 03:31:42 PM

Sent by:    netfilter-admin@lists.netfilter.org


To:    netfilter@lists.netfilter.org
cc:
Subject:    Re: nmap



On Tuesday 22 October 2002 4:42 pm, antonio wrote:

> Hi Everyone,
>
> Just a question:
> I want to set up a firewall box with iptables in which I can use nmap.
> Which ports/protocols can I set to ACCEPT and which to DROP?

Do you mean you want to run nmap on a box also running netfilter, to scan
other machines ?

If so, set your OUTPUT policy to ACCEPT, set your INPUT policy to DROP with
a
single rule:

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

and you'll be able to scan other machines and get the replies back, but
anything new coming in to your machine will be blocked.

If I didn't understand correctly what you wanted to do please give more
details.

Antony.

--

Which part of 'apt-get dist-upgrade' do you not understand ???





