From: Erik Pagel <erik.pagel@gmx.de>
Subject: Re: Yet another FTP connection problem
Date: Thu, 06 Jun 2002 18:27:24 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <376292209.1023388044@[192.168.13.4]>
References: <200206061555.g56FtUA31837@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206061555.g56FtUA31837@vulcan.rissington.net>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

Hi again,
sorry not to be specific enough,


>> there seems to be a problem within my FTP rules. I'm not able to make any
>> ftp connection.
>> I'm able to send but not to recevie any package.
>
> Please be more specific.   If you are "unable to make any ftp connection"
> then how are you able to send files ?
No I'm not able to send any files. I'm not even able to make any connection.
All end with a connection timeout. Iptraf shows that the response to my 
first tcp-package (SYN) from the ftp server made it to my external 
interface but didn't get through the rules.
Maybe my internet box didn't recognise it as related connection.
The ip_nat_ftp and ip_contrack_ftp modules are loaded.

> You say you can send but not receive - do you mean that the PUT command
> works  and the GET command doesn't ?
>
> If that is what you mean, then it's not a netfilter problem.....
see above.
>
> Antony.
>
bye Erik


