From: Fabrice MARIE <fabrice@netfilter.org>
Subject: Re: Am I making a bone-headed mistake with patch-o-matic ?
Date: Sun, 24 Nov 2002 12:43:58 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211241243.59265.fabrice@netfilter.org>
References: <031e01c2930e$41097800$4545450a@drbroyles.com>
Reply-To: fabrice@netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <031e01c2930e$41097800$4545450a@drbroyles.com>
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
To: netfilter@drbroyles.com, netfilter@lists.netfilter.org


Hello,

On Sunday 24 November 2002 00:34, netfilter@drbroyles.com wrote:
> Hello.  I am interested in installing the time extension to iptables but I
> am unable to run the following command ...
>     iptables -m time
> I get the resulting output ...
>     iptables v1.2.7a: Couldn't load match
> `time':/usr/local/lib/iptables/libipt_time.so: cannot open object file: No
> such file or directory
> I obviously don't have that file.

Correct. You need to patch your kernel, and recompile the iptables utility.

>  I've tried running patch-o-matic like so
> ...
>     KERNEL_DIR=/usr/src/linux-2.4.19 | ./runme base  (this is run from
> within the patch-o-matic directory)

Should be a semi colon and not a pipe..

> Everything looks like it works fine, so I go to my kernel source directory
> and run a 'make menuconfig' but I don't see any new options for any of the
> extension patches that should be installed now.  Am I making a bone-headed
> mistake and just completely missing something?  I am running RedHat 7.2 and
> obviously trying to setup kernel 2.4.19.  I got the latest patch-o-matic
> via cvs and I installed iptables 1.2.7a from a tar.bz2 file from
> netfilter.org.

I guess you should read the netfilter-extension-HOWTO from there :
http://www.netfilter.org/documentation/HOWTO/netfilter-extensions-HOWTO.html

There is a problem though (fixed in the CVS, but not yet updated on the HTML page..)
you shouldn't run # make patch-o-matic, but instead from the patch-o-matic directory,
you should run the ./runme script with the patch suite you want to apply as a parameter.
The corrected SGML source of the document is there :
http://cvs.netfilter.org/cgi-bin/cvsweb/~checkout~/netfilter/documentation/HOWTO/netfilter-extensions-HOWTO.sgml

Have a nice day,

Fabrice.
--
Fabrice MARIE

"Silly hacker, root is for administrators"
       -Unknown

