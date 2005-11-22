From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: Logging to the screen
Date: Tue, 22 Nov 2005 20:26:46 +0100
Message-ID: <20051122192646.GA1821@torres.l21.ma.zugschlus.de>
References: <43836074.3000403@mail.bloomfield.k12.mo.us>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <43836074.3000403@mail.bloomfield.k12.mo.us>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Nov 22, 2005 at 12:16:20PM -0600, Scott Mayo wrote:
> I just noticed that my fireall is sending some of my LOGs to the screen. 
>  I had tried setting something up a while back to LOG certain things, 
> and was not sure if it was working or not.  Today, I went to the actual 
> firewall itself and see all this info that I had my IPTABLES log, on the 
> screen.  Any reason why it is not sending it to the /var/log/messages?

It should be sending to syslog via klogd, if you have that properly
set up. To keep it from logging to the console, set sysctl
kernel.printk to something like 2 4 1 7

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Mannheim, Germany  |  lose things."    Winona Ryder | Fon: *49 621 72739834
Nordisch by Nature |  How to make an American Quilt | Fax: *49 621 72739835

