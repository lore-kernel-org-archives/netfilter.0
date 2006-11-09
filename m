From: Bo Yang <struggle@mail.nankai.edu.cn>
Subject: Re: How to configure firewall rules through a website
Date: Thu, 09 Nov 2006 12:42:37 +0800
Message-ID: <363047600.26254@mail.nankai.edu.cn>
References: <362910564.24851@mail.nankai.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Message-ID: <4552B1BD.8000303@mail.nankai.edu.cn>
In-Reply-To: <362910564.24851@mail.nankai.edu.cn>
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
To: Satvika Bejai <202501281@ukzn.ac.za>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1
 
Satvika Bejai :
> Hi
>
> I've just been introduced to netfilter. I would like to know if it is
> possible to configure the firewall rules from a text file that is
> written to by some script attached to a website. I am trying to
Of course , it can .
There are too tools in iptables distribution : iptables-save and
iptables-restore , which used
to save or restore the iptables rules data .
You can just let your script to write the iptables in the
iptables-save format , and then run
iptables-restore in the file data .
So ,if you do what the above describe , you need to get the user input
from your web ,
and parsing the input , convert them to the format iptables-restore
can understand .
And , OK

> configure a firewall on Snapgear linux which is hosting a website which
> is supposed to alllow a user to enter configuration rules. I hope to
> save these to a text file from which i would like the netfilter program
> to read from.
> Is this possible. I only have a week to get this done, so
> any help is greatly appreciated.
>
> Thanks
> Satvika
> Please find our Email Disclaimer here: http://www.ukzn.ac.za/disclaimer/
>
>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
 
iD8DBQFFUrG97tZp58UCwyMRAg76AJ4w7/0o9YqqKLdPC7NapOu2I5nmdwCfZRp7
Ja36GK+unjovp+aeeQ9lhSg=
=Hshd
-----END PGP SIGNATURE-----


