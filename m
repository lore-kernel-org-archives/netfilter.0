From: "Sez" <sezmillenium@yahoo.es>
Subject: RE: Iptables do nat with Protocol 47 or GRE
Date: Fri, 14 May 2004 13:14:50 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1BOadZ-0002lJ-PP@vishnu.netfilter.org>
References: <200405141139.39356.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405141139.39356.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

I am a newbie ... Some tutorial to do this?? I have redhat 8.0, some rpm
with pptp nat connection tracking??

I read in some site that i must recompile the kernel??? Or only iptables???
I am a bit confussed!


-----Mensaje original-----
De: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] En nombre de Antony Stone
Enviado el: divendres, 14 / maig / 2004 12:40
Para: netfilter@lists.netfilter.org
Asunto: Re: Iptables do nat with Protocol 47 or GRE

On Friday 14 May 2004 11:24 am, Sez wrote:

> Hi people,
>
> I have a a vpn server in my Intranet. If i want access to this server 
> i will pass my firewall.
>
> The diagram is
>
> VPN_CLIENT(W2k box) ---- router ---- (192.168.55.94 eth0) FIREWALL
> (192.168.55.95 eth1)-------- (192.168.55.92)VPN_SERVER
>
> I create all iptables rules and VPN_CLIENT can connect to server. One 
> client go well. But if another client try to connect he has this error
> 		*** error  721: Remote server don't response. ***

Are you using the PPTP NAT connection tracking helper module?   If not, you 
will not be able to support more than one connection at a time.

Regards,

Antony.

--
There are two possible outcomes:

 If the result confirms the hypothesis, then you've made a measurement.
 If the result is contrary to the hypothesis, then you've made a discovery.

 - Enrico Fermi

                                                     Please reply to the
list;
                                                           please don't CC
me.


