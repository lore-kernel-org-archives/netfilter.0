From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: problem reach the internal.
Date: Sat, 30 Nov 2002 02:35:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DE815EA.9040303@fugmann.dhs.org>
References: <20021130010348.58897.qmail@web14507.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: "james.Q.L" <shijialeeee@yahoo.ca>
Cc: netfilter@lists.netfilter.org

james.Q.L wrote:
> sorry, i forgot mention that the request from outside my local network to the INET_IP:8888 is
> fine. only the internal request to it fails.
> 
> i do not see what is wrong in the rules, anyone ? 

It cannot be done, as the webserver will try to give an answer to the 
query directly, and not back through your router, and thus the client 
will not accept the reply.

For a more complete explanation, search the email archives. This 
question has been asked and answered numerous times.

Regards
Anders Fugmann


