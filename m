From: "Ian! D. Allen" <idallen@idallen.ca>
Subject: Re: DNATing back to the same network
Date: Wed, 9 Feb 2005 03:43:28 -0500
Message-ID: <20050209084328.GB7429@elm.home.idallen.ca>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

>However, when a local users tries to connect to the public IP and DNATed
>port, the connection fails. Which is basically logical as the server
>receives a packet with the source IP of the actual user and it answeres
>directly to that IP.  Is it possible to change netfilter behaviour? Any
>other work-around for that?

As Samuel noted, that is described here:

    http://www.netfilter.org/documentation/HOWTO/NAT-HOWTO-10.html

and I elaborate on it here:

    http://idallen.com/dnat.txt

-- 
-IAN!  Ian! D. Allen   Ottawa, Ontario, Canada
       EMail: idallen@idallen.ca   WWW: http://www.idallen.com/
       College professor (Linux) via: http://teaching.idallen.com/
       Support free and open public digital rights:  http://eff.org/

