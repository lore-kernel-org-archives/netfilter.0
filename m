From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: FORWARD-ed packet doens't reach POSTROUTING
Date: Mon, 23 Aug 2004 13:45:58 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <412A3B66.3070907@pbl.ca>
References: <200408201559.49352.fred@gansevles.defamilie.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408201559.49352.fred@gansevles.defamilie.nl>
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
To: Netfilter User Mailinglist <netfilter@lists.netfilter.org>
Cc: Fred Gansevles <fred@gansevles.defamilie.nl>

Fred Gansevles wrote:
> Hello,
> 
> First: I'm not subscribed to this list so please make sure that any reply is 
> also sent to: fred@gansevles.defamilie.nl

This is very unpolite (to say it mildly).  I could bet you haven't 
checked the archives either?  Please, subscribe.

Just to not be labeled as (total) old grunge.  I'd check rules in 
FORWARD chain.  Packets are dropped somewhere, and by what you 
described, FORWARD chain is the most likely culprit.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

