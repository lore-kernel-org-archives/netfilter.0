From: Dimitri Yioulos <dyioulos@firstbhph.com>
Subject: Re: Port forwarding question
Date: Thu, 21 Sep 2006 16:53:46 -0400
Message-ID: <200609211653.46613.dyioulos@firstbhph.com>
References: <200609211555.39634.dyioulos@firstbhph.com>
	<4512F520.6010104@candlefire.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4512F520.6010104@candlefire.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Thursday September 21 2006 4:25 pm, you wrote:
> Greetings,
>
> Dimitri Yioulos wrote:
> > Noob, question:
> >
> > I want to allow a vendor to access a piece of equipment on our
> > LAN (192.168.100.46) through port 4000 from outside via a server
> > in our DMZ (www.xxx.yyy.zzz).  While I should know how to do
> > this, I'm not 100% sure.  Can someone help?
>
> DNAT.
>
> for example:
> iptables -t nat -A PREROUTING -d www.xxx.yyy.zzz -i eth1 -p tcp
> --dport 4000 -j
> DNAT --to 192.168.100.46

eth1 being the DMZ iface?

> iptables -t filter -A INETIN -d 192.168.100.46 -p tcp --dport 4000
> -j ACCEPT
>
> > Oh, and separately, how would I allow that access only through
> > the vendor's ip address, if that were the way I decided to go?
>
> for example:
> iptables -t nat -A PREROUTING -s 1.2.3.4 -d www.xxx.yyy.zzz -i eth1
> -p tcp --dport 4000 -j DNAT --to 192.168.100.46
>
>
> Regards,
>
> --
> Ritter

-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.


