From: Drew Leske <dleske@uvic.ca>
Subject: Re: Login load balancing
Date: Thu, 27 Apr 2006 10:37:58 -0700
Message-ID: <44510176.7020108@uvic.ca>
References: <444FAEFF.1040100@uvic.ca>
	<444FE835.2010007@gmx.net>	<444FEC93.6070101@uvic.ca>
	<Pine.LNX.4.64.0604272026100.18949@amp.grife.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.64.0604272026100.18949@amp.grife.net>
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
To: michael@grife.net
Cc: netfilter@lists.netfilter.org

michael@grife.net wrote:
> On Wed, 26 Apr 2006, Drew Leske wrote:
> 
>> Unfortunately we don't control the DNS--another group here has
>> responsibility for that.  I'll chat with them and see if they have
>> provision
>> for remote updates.
> 
> There is another possibility you could consider. Instead of having them
> enable remote updates, get them to delegate a new zone for you.
> 
> All you would need to do then is setup some bind servers. You would then
> have direct access to update the A records.

I considered that, but then I'm implementing a service provided by experts
in another group.  (I provide a BIND server internally for our cluster, but
not one with public access.)  This is, shall we say, "discouraged" (for good
reason--it's one more thing to be an expert in and we've already got experts
elsewhere).

Thanks!
Drew.

-- 
Drew Leske :: Systems Group/Unix, Computing Services, University of Victoria
  dleske@uvic.ca / +1250 472 5055 (office) / +1250 588 4311 (cel)

