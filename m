From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: Marking packets: order is important?
Date: Thu, 16 Sep 2004 11:58:39 +0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <3063e5040916015858fe42d0@mail.gmail.com>
References: <086C43C9A9A1A541BFDFABCFDA05F589028E413B@mailnew.tecnun.es>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <086C43C9A9A1A541BFDFABCFDA05F589028E413B@mailnew.tecnun.es>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Yes, as the comments say, the first rule just make sure everything
gets marked with 23, unless the packets also match the next rules, and
they are marked again. the MARK target does not stop the packets
"walking" throught the chain, only DROP, ACCEPT, RETURN and others,
but these 3 are most used.

On Thu, 16 Sep 2004 10:51:16 +0200, Arrizabalaga, Saioa
<sarrizabalaga@ceit.es> wrote:
> 
> I am analysing the script written in the ADSL-Bandwith-Management-HOWTO
> I found in www.tldp.org.
> 
> It marks all the packets depending on the ports they use, for example:
> 
> iptables -t mangle -A MYSHAPER-OUT -p tcp --dport 0:1024 \
> -j MARK --set-mark 23     # Default for low port traffic
> iptables -t mangle -A MYSHAPER-OUT -p tcp --dport 20 \
> -j MARK --set-mark 26     # ftp-data port, low prio
> 
> But as far as I can see, the packet that matches the second rule,
> matches the first rule as well, so, I guess that when this packet is
> marked by the first rule (--set-mark 23), follows the chain, sees that
> it also matches the second rule and then it is marked again with the new
> value(--set-mark 26).
> 
> I would like someone to confirm this. If all this is true, the most
> specific rules should be placed at the end, am I right?
> 
> Regards,
> 
> Saioa Arrizabalaga
> 
> 



-- 
Bla bla

