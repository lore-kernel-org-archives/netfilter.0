From: Martin Stricker <shugal@gmx.de>
Subject: Re: how to block files with specific extensions
Date: Fri, 06 Sep 2002 23:31:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D791EA1.E962D99D@gmx.de>
References: <FLEKIPPLAEDMJMOOBBDPEEMGCNAA.stewart.thompson@shaw.ca>
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
Content-Type: text/plain; charset="us-ascii"
To: saravanan sakthi <lxsara@yahoo.com>, netfilter@lists.samba.org

Stewart Thompson wrote:
> 
> Hi Saravanian:
> 
>         Netfilter is a packet based system. So, it don't think
> you can do what your proposing with it. There may be other
> applications that could that operate at a higher level in the
> OSI stack. If you give the list a better description of  your
> exact requirements. Someone might be able to make a
> suggestions.

Depending on what kind of files you want to filter, you will have to do
it in different software: To prevent downloading certain files with the
web browser or via FTP (which most browsers can do also), you need to
set up a web cache/proxy. Popular software for that on Linux is squid.
Then configure squid to deny the file extensions you don't like, and
configure netfilter to only accept HTTP/FTP connections from your proxy.

If you want to deny certain file types as e-mail attachments you have to
do so in your e-mail server software. Procmail should be able to, and
several ant-virus software can do this also.

Best regards,
Martin Stricker
-- 
Homepage: http://www.martin-stricker.de/
Linux Migration Project: http://www.linux-migration.org/
Red Hat Linux 7.3 for low memory: http://www.rule-project.org/
Registered Linux user #210635: http://counter.li.org/

