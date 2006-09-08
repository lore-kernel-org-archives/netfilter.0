From: Dmitri <dk-netfilter@nth.ca>
Subject: Re: matching -d to a given interface without specifying ip address
Date: Thu, 07 Sep 2006 21:42:19 -0400
Message-ID: <4500CA7B.6050304@nth.ca>
References: <009601c6cfdf$c4406910$0101000a@tanjian> <44FD003D.7080509@nth.ca>
	<edn2vt$4dl$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <edn2vt$4dl$1@sea.gmane.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Danny Rathjens wrote:
> Dmitri wrote:
>> The problem with specifying an IP is that it may change, which breaks 
>> the rules and requires an update (and detection as well). Event for a 
>> static IP, that's an extra dependency to watch out for.
> 
> That's what variables in your firewall script are for.
> Just re-run it when your network connection restarts:
> EXTIF="eth0"
> EXTIP=`ifconfig $EXTIF |perl -ne'print $1 if /inet addr:([\d.]+)/'`
> iptables -A INPUT -j ACCEPT -i $EXTIF -p tcp -d $EXTIP --dport 80

Yes, but it's exactly the sort of hack I hoped to avoid. For a perfectly 
simple expression, now I need to 1) detect that IP changed or connection 
restarted, and 2) run the hack. There isn't supposed to be any firewall 
script.

It's like SNAT vs. MASQUERADE - MASQUERADE works without any scripts or 
reloads. Same can be done with other things which require reloading. The 
less dynamic hacks in the system, the less of a nondeterministic mess it 
would be.

Well, I guess the answer to my question is "no, there is no such 
option". I'm half-considering implementing it myself, if I can find 
heads and tails of it.

Thanks,
--Dmitri

