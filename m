From: Nils Juergens <ju@isf.rwth-aachen.de>
Subject: Re: port forwarding
Date: Wed, 23 Jul 2003 10:02:39 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030723080239.GA6551@koala7>
References: <015701c350e0$7fdcf7b0$2a0110ac@SAMHP>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <015701c350e0$7fdcf7b0$2a0110ac@SAMHP>
Content-Disposition: inline
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Wed, 23.07.03, Sathi <sathiyan@gmx.net> wrote:

> I am running squid reverse proxy for 5 different web servers.
> 
> I want to provide ftp access to clients so that they can update the web page
> content.
> 
> As all the host name resolve to the single address i find problem in port
> forward the ftp request to the correct backend web server.

If you have more than one IP you could set up your DNS like this:

say your domains are
customer1.yourdomain.example
customer2.yourdomain.example
...
customer5.yourdomain.example

which all resolve to the same IP. Now set up new entries

ftp1.yourdomain.example
ftp2.yourdomain.example
...
ftp5.yourdomain.example

which point to the corresponding server (not to the same ip). Now you only
have to tell your customers which host to use an you are all set.

I think another solution would be to use a ftp proxy, where your clients get
redirected based upon username.

User A logs in as 'usera@customer1.yourdomain.example', the ftp-proxy looks up
the corresponding ftp-server from a table and redirects the ftp session to
that ftp-server. 'userb@customer1.yourdomain.example' is redirected to the
same server, where 'userc@customer2.yourdomain.example' is redirected to
another server.

cya,

Nils


-- 
Nils Juergens  | ju@isf.rwth-aachen.de
Having problems sending big files over the net?
Try out Efisto (http://efisto.rnbhq.org).


