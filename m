From: "Michael Ransburg" <michael.ransburg@gmail.com>
Subject: Filter a TCP stream based on a text appearing in the initial IP
	packet of the stream
Date: Thu, 10 May 2007 14:51:45 +0200
Message-ID: <22b256140705100551q3a67e680nb184c23f4966cb1d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=ksx5uY7bE4EM6Clu1YAUhO+ZeAQCHgNO3+FMjS0GyzSrUszyIEBYYF+4ezLZOLnIfCPgw+tF6z/2ibtugSX4Y+SKIL5OndOvBmdKMGfCTKhxq2xzmJxzx5zaeyTk2PQS3Fs0kNbjY8VdPm2maXBmGT+iMpwsmvNuq9mRyYZKzbE=
Content-Disposition: inline
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

Hi all,

let's say someone is downloading a website using http/tcp/ip. This
website is very large, i.e., there will be many IP packets in this TCP
stream. I know that there is a certain phrase at the top of the
website, let's say "foobar", which will therefore be part of the first
IP packet of this TCP stream.

I know that I can use the string match mechanism to match this first
IP packet and drop it.

However, is it also possibe to drop _all_ IP packets belonging to this
TCP stream (i.e., also the reminder of the website) _if_ the first
packet includes the phrase "foobar"?

So what I want to say in a rule is:
If the first (or simply "a") IP packet of a TCP stream contains a
given phrase, then please filter (match) all IP packets which belong
to this TCP stream.

Can this be done using iptables / netfilter?

Thanks,
Michael
-- 
icq: 71772353 | skype: daneel1409 | msn: mike@unfolded.com

