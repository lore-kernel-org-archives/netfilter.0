From: Payal Rathod <payal-iptables@staticky.com>
Subject: Re: please advise on this rule
Date: Thu, 14 Aug 2003 12:17:50 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030814064750.GA1761@linux.local>
References: <7C9884991ADAE0479C14F10C858BCDF5122E1F@alderaan.smgtec.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5122E1F@alderaan.smgtec.com>
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
Content-Transfer-Encoding: 7bit
To: Daniel Chemko <dchemko@smgtec.com>
Cc: netfilter@lists.netfilter.org

On Tue, Aug 12, 2003 at 11:51:42AM -0700, Daniel Chemko wrote:
> Source field doesn't matter since traffic destined for the internal
> (private) network will only pass through that chain if you define DNAT
> rules for them.

oh! ok.
 
> The port 80 rule seems ok, but trusting something like that where a user
> can change their IP's or use different port numbers, it is pretty light
> security for anyone who knows what they are doing.


Yes agreed. But I am counting on the users not knowing how to change the
ips :)
(Yes this is possible in my company).

Thanks and bye.
With warm regards,
-Payal

-- 
"Visit GNU/Linux Success Stories"
http://payal.staticky.com
Guest-Book Section Updated.

