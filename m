From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: [Fwd: Question with WebMail + Mail Server]
Date: Sat, 24 Apr 2004 14:10:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404241410.59333.Antony@Soft-Solutions.co.uk>
References: <408A6290.B684D53D@ita.org.mo>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <408A6290.B684D53D@ita.org.mo>
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

On Saturday 24 April 2004 1:50 pm, edwardspl@ita.org.mo wrote:

> Dear All,
>
> There is Firewall + WebMail + Mail Server in a computer machine ( Linux
> Server ) :
>
> Firewall is using iptables, protocol of WebMail ( IMP 3.2.3 ,
> http://horde.org/imp ) is using imap/notls and port is using 143, and
> the Mail Server is using imap ( come with Fedora Core 1 Linux ).
>
> iptables ruls :
>
> iptables -P INPUT DROP
> iptables -A INPUT -i eth0 -p tcp --dport 143 -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --dport 80 -j ACCEPT
>
> But I have the following the problem :
> http://marc.free.net.ph/message/20040318.053223.3f53fbd8.html
>
> So, who can help me to fix this kind of problem ?

1. Does the problem go away if you (temporarily) change the default INPUT 
policy to ACCEPT instead of DROP?

2. What OUTPUT rules do you have (specifically, are you allowing in the reply 
packets)?

3. I suggest using a packet sniifer (eg: ethereal), or add some LOGging 
statements to your INPUT & OUTPUT chains to see what packets are actually 
present.

Regards,

Antony.

-- 
"Black holes are where God divided by zero."

 - Steven Wright

                                                     Please reply to the list;
                                                           please don't CC me.


