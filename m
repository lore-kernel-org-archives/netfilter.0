From: Ian Holsman <kryton@gmail.com>
Subject: Re: how to redirect certain IPs to specific url
Date: Thu, 1 Jul 2004 11:11:31 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2a627cd2040630181121a67ba6@mail.gmail.com>
References: <a0f69e504063000446f514e22@mail.gmail.com>
Reply-To: ian@holsman.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <a0f69e504063000446f514e22@mail.gmail.com>
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
To: Askar Ali Khan <askarali@gmail.com>
Cc: netfilter@lists.netfilter.org

Hi.
If your running a apache webserver you can do this via re-write rules

check out http://httpd.apache.org/docs-2.0/mod/mod_rewrite.html

something like
rewriteengine on
RewriteCond %{REMOTE_HOST}  ^host1.*  [OR]
RewriteCond %{REMOTE_HOST}  ^host2.*  [OR]
RewriteCond %{REMOTE_HOST}  ^host3.*
RewriteRule ...some special stuff for any of these hosts...

On Wed, 30 Jun 2004 12:44:09 +0500, Askar Ali Khan <askarali@gmail.com> wrote:
> 
> hi
> got a very simple question, i want to redirect certain IPs(clients)
> request to a specific URL (ip)?
> and also later on how to Flush the specific rule from the the chain as
> -A will append it on the bottom, how  i will delete it ?
> 
> thanks
> 
>

