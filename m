From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Problem with connection-tracking and FTP
Date: Thu, 22 Jan 2004 07:45:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040122074528.5fe4905a.arnt@c2i.net>
References: <002001c3df6e$a97416e0$0600a8c0@blackbox>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002001c3df6e$a97416e0$0600a8c0@blackbox>
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

On Tue, 20 Jan 2004 17:01:26 +0100, 
"Christian Gmeiner" <christian@visual-page.de> wrote in message 
<002001c3df6e$a97416e0$0600a8c0@blackbox>:

> Hi everybody.
> 
> I am working on a little firewall script. Everything works just fine,
> but i dont get the ftp protocoll working.
> 
> I call this two function to get ftp working:
> 
> # ==================================
> FTP()
> {
>     ebegin "Seting rules for active/passive FTP"

..<snip>

>     eend $?
> }

..does whatever which is supposed to parse this, 
understand "ebegin" and "eend" ???

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



