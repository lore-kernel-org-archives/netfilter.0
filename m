From: Drew Leske <dleske@uvic.ca>
Subject: Re: Login load balancing
Date: Wed, 26 Apr 2006 11:40:10 -0700
Message-ID: <444FBE8A.7080803@uvic.ca>
References: <017e01c6695e$1e77d550$0419a8c0@fly>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <017e01c6695e$1e77d550$0419a8c0@fly>
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
To: pablo@blueoakdb.com
Cc: netfilter@lists.netfilter.org

Hi Pablo,

Pablo Sanchez wrote:
>> The only half-solution I have come up with so far is to define a 'director'
>> box with the 'bob' alias, and then periodically grab load metrics from the
>> participating hosts, determine of the 'bob's which is the least loaded, and
>> then *cough* update a DNAT rule to redirect requests coming in for 'bob' to
>> the least-loaded 'bobX'.
> 
> I believe the above is what you'll want to implement.  As your research has
> probably already shown, the load balancers in the market are for HTTP.  A
> good load balancer will need to communicate with the backend clients so it
> has data on load and other metrics necessary for it to make a decision on
> which server to serve.

You're right about load-balancing HTTP.  Everybody and their dog wants to
load-balance HTTP for some reason. ;)  But my dog insists on load-balancing SSH.

I have also found something called LVS, but as I've mentioned in another
post this is unsuitable for us.  Grabbing the load data as I've said is no
problem--the default SNMP daemon provides CPU load I believe by default, and
it's no problem at all to provide for additional information.  This part is
trivial since I've already implemented SNMP elsewhere.

> You could use wget to fetch metrics from all the servers (include a
> timestamp so you know when your data is stale) and have the director
> consider this information when it punches down new IPTABLEs rules.

SNMP would be faster and more lightweight I believe; wget implies I'd have
either an HTTP or FTP service running on each of those machines.  Plus,
these connections would be subject to TCP timeouts, so if one of the
machines is down, my metric-gathering script would take forever timing out
on it.  SNMP fails a lot faster.  Also, there'd be quite a bit less parsing
to do of the results.

Thanks for your response!
Drew.

-- 
Drew Leske :: Systems Group/Unix, Computing Services, University of Victoria
  dleske@uvic.ca / +1250 472 5055 (office) / +1250 588 4311 (cel)

