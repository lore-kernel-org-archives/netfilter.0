From: Shane Hickey <shane@howsyournetwork.com>
Subject: Re: Need help with rate-limiting NTTP traffic
Date: Thu, 1 Apr 2004 09:24:14 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040401092414.6b7b43f7@daneel.volumen.net>
References: <20040331165409.0d498074@daneel.volumen.net>
	<200404010916.58286.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404010916.58286.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

Antony Stone <Antony@Soft-Solutions.co.uk> [2004-04-01 09:16]:
> What are you using as your NNTP server?   If it's INN, I'm pretty sure
> that has its own rate-limiting mechanism as a configuration parameter,
> and you'd be better off doing rate limiting in the application itself
> if it's at all possible.

	I'm not serving NNTP, I'm just constantly connected to an NNTP server
using Pan.  I should have made that more clear in my e-mail.  There
aren't any bandwidth controls in Pan, that I could see, and it
will happily stomp over all my other traffic.  It was extremely easy to
limit only my nntp traffic (that is, traffic coming into my network with
a source port of 119) in Dummynet.  Can anyone offer ideas with tc and
netfilter?

Shane

-- 
Shane Hickey <shane@howsyournetwork.com>: Network/System Consultant
GPG KeyID: 777CBF3F
Key fingerprint: 254F B2AC 9939 C715 278C  DA95 4109 9F69 777C BF3F
Listening to: Cypress Hill - Hole In The Head

