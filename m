From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: shorewall
Date: Mon, 8 Sep 2003 10:52:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309081036.47127.gdh@acentral.co.uk>
References: <F22386C3FEB012449238672E38ED61E70A8CB0@overlord.overturemedia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F22386C3FEB012449238672E38ED61E70A8CB0@overlord.overturemedia.com>
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
To: netfilter@lists.netfilter.org

On Monday 08 September 2003 10:26, Fritz Mesedilla wrote:
> Has anybody used shorewall? If I try shorewall to fix my nat problem (make
> it easier) and still does not work, will I be able to disable shorewall and
> implement a manual setup of iptables again?

Shorewall is just a set of scripts to try and make managing netfilter a little 
easier. All it does it generate lots of 'iptables' commandlines based on 
values you plug into /etc/shorewall/*

If you decide you don't like it, simply delete the script files, and do 
iptables -F ; iptables -X to clean everything out...

Cheers,
Gavin.

