From: Robby Workman <netfilter@rlworkman.net>
Subject: Re: Filtered Port
Date: Tue, 31 Jan 2006 09:44:05 -0600
Message-ID: <43DF85C5.4080804@rlworkman.net>
References: <43DF6C38.6010204@mail.bloomfield.k12.mo.us>	<61929.193.173.147.3.1138716397.squirrel@webmail.sterenborg.info>	<43DF7196.6070606@mail.bloomfield.k12.mo.us>	<58058.193.173.147.3.1138718408.squirrel@webmail.sterenborg.info>
	<43DF7CF1.4060607@mail.bloomfield.k12.mo.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43DF7CF1.4060607@mail.bloomfield.k12.mo.us>
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

Scott Mayo wrote:
> Rob Sterenborg wrote:
>> In that case you may want to allow forwarding ;-)..
>>
>> $ipt -A FORWARD -i <if_inet> -o <if_lan> -d <ip_controlled_host> \
>>   -p tcp --dport 3389 -j ACCEPT
>>
> 
> This did not let it go through either.  It must not be the iptables 
> causing it.  I took everything out of my rules except for the PREROUTING 
> rule above and my POSTROUTING rule for SNAT and I am getting the same 
> thing.
> 
> I am not sure what else would be blocking this, unless it is the 
> upstream ISP.  I don't think it is, but I have sent them an email to 
> make sure.  Only thing this machine is used for is to be a filter using 
> IPTABLES, Squid and Dansguardian.


Scott:

Are the counters showing any packets hitting those rules?

RW

-- 

http://rlworkman.net

