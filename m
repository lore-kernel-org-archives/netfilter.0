From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: Time based rules ...
Date: Thu, 14 Nov 2002 10:38:36 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211141038.36884.dharmu@nsecure.net>
References: <1037199668.4556.30.camel@rayw.knowledgefactory.co.za>
Reply-To: dharmu@nsecure.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1037199668.4556.30.camel@rayw.knowledgefactory.co.za>
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
To: Raymond Leach <raymondl@knowledgefactory.co.za>, Netfilter Mailing List <netfilter@lists.netfilter.org>

What is the default polic you have set for? I guess it is by dropping all the 
packets froom the forward chain and then you are allowing accordingly.
Regards,
Dharmendra.T
Linux Security Expert
www.nsecure.net
dharmu@nsecure.net
On Wednesday 13 November 2002 20:31, Raymond Leach wrote:
> Hi
>
> Is there a way to put time restrictions on rules?
> For eaxmple, something like:
>
> iptables -A FORWARD -i eth0 -p tcp -sport 1024: -dport 1024: -time
> 0700:1700 -j DROP
>
> It would be nice ...
>
> Ray

-- 


