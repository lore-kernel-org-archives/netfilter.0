From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Strange ip_conntrack values
Date: Sun, 18 Jul 2004 17:31:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407181731.15709.Antony@Soft-Solutions.co.uk>
References: <ef83df6b040718033163810a15@mail.gmail.com> <200407181617.52652.Antony@Soft-Solutions.co.uk> <ef83df6b04071809196afdf5aa@mail.gmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <ef83df6b04071809196afdf5aa@mail.gmail.com>
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

On Sunday 18 July 2004 5:19 pm, John wrote:

> > Good.   That to me looks like a good TCP sequence, however there is one
> > packet missing - the ACK response from "mydomain" to 24.33.232.227 in
> > response to the FIN-ACK sent by 24.33.232.227 in packet number 1488.  
> > Until this missing response is seen by netfilter, it will regard that
> > connection as being in the TIME_WAIT state, however this will expire
> > after 2 minutes.
>
> yep strange ... for many sequences it's the same thing. the web server
> is under Red Hat 7.2

Huh?

$ telnet 24.33.232.227 80
Trying 24.33.232.227...
Connected to 24.33.232.227.
Escape character is '^]'.
HEAD / HTTP/1.0

HTTP/1.0 200 OK
Accept-Ranges: bytes
Date: Sun, 18 Jul 2004 16:29:40 GMT
Content-Length: 988
Content-Type: text/html
Server: Microsoft-IIS/5.1
Content-Location: http://24.33.232.227/Default.htm
Last-Modified: Fri, 05 Sep 2003 15:24:32 GMT
ETag: "30633ecec173c31:9f5"

Connection closed by foreign host.
$

Note the line saying "Server: Microsoft-IIS/5.1"

I really don't think that can be running under Red Hat 7.2 :)

Anyway, getting back to the question at hand, I guess one valid approach is 
"is this causing you any problems?"   ie: Is your connection tracking table 
getting full and dropping new connections because of all these 2-minute 
timeouts you're seeing?

Antony.

-- 
Anything that improbable is effectively impossible.

 - Murray Gell-Mann, Nobel Prizewinner in Physics

                                                     Please reply to the list;
                                                           please don't CC me.


