From: "Alex Bennee" <alex@bennee.com>
Subject: Re: how to drop MP3 and other Downloads
Date: Tue, 12 Nov 2002 12:32:21 -0000 (GMT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <38978.217.42.120.194.1037104341.squirrel@www.bennee.com>
References: <088301c28a44$e3aa6740$13fcc5cb@nextto>
Reply-To: alex@bennee.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <088301c28a44$e3aa6740$13fcc5cb@nextto>
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
To: hareram@sol.net.in
Cc: netfilter@lists.netfilter.org, isp-linux@isp-linux.com

hare ram said:
> Hi all
>
> i have small application here like
> how do the drop all downloads more than 1MB from
> the day time
> and rest of the time open for all

That of course was not the connbytes patch. You can find it at
http://luxik.cdi.cz/~devik/connbytes/.

You may need some sort of crontab to change the rules as you go. You can
also use connbytes with the --mark to move all long lived downloads to a
lower tc class if your doing traffic shaping.

Alex
www.bennee.com/~alex/



