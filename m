From: Todd Landfried <tlandfried@viatornetworks.com>
Subject: Re: How to redirect browsers with static proxy settings in iptables?
Date: Sun, 25 Jul 2004 10:35:02 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F5880758-DE60-11D8-944B-000A95C62BFA@viatornetworks.com>
References: <BAY2-F18gRXrJrozCsV00007623@hotmail.com> <200407251424.07223.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0 (Apple Message framework v618)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407251424.07223.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Thank you for the response.

The problem is the proxy setting may change as she moves from office to 
office. Therefore, I'd like to set it up so regardless of what HER 
settings are, they'll work here.

Todd


On Jul 25, 2004, at 6:24 AM, Antony Stone wrote:

> I don't understand (I think).   Are you trying to intercept HTTP 
> requests from
> browsers (in which case you just intercept *all* TCP port 80/8080/3128
> traffic, no matter where it's addressed to), or are you saying that 
> you can't
> keep track of where to redirect it to, because the proxy address moves 
> around
> (in which case you're as stuck as someone running a browser would be, 
> trying
> to direct requests to a moving proxy).
>
> What exactly is the problem?
>
> Regards,
>
> Antony.


