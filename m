From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: RFC 1035 Bind
Date: Tue, 09 Nov 2004 15:56:21 -0600
Message-ID: <41913D05.9040501@pbl.ca>
References: <20041109190202.GB18755@marschmellow.homeunix.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041109190202.GB18755@marschmellow.homeunix.net>
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
To: Netfilter User Mailinglist <netfilter@lists.netfilter.org>

Mark-Walter@t-online.de wrote:
> Ok, I know there could be a problem in the inside of a webserverfarm
> and you need to allow both protocols and he is refering to this
> but generally I would like prefer to avoid TCP over port 53 concerning
> to avoid a man-in-the-middle attack.

I've read the article, and found an error in it.  If the response does
not fit into 512 bytes, it is the client side (be it real client, or
another DNS server) that will open connection on TCP 53, reissue the
query, and read response.  Which is completely different than what was
described on that page (server side opening connection back to the
client side).

Back to your question.  Yes, you should allow both UDP and TCP for DNS
queries.  In both cases, outgoing only.  Unless you have publicly
available DNS server (in which case you will obviously need to allow
incoming for both UDP and TCP).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7


