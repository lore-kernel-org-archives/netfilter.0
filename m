From: Julian Gomez <julianjose.gomez@getronics.com>
Subject: Re: FTP problems on ports other than 21
Date: Tue, 27 Jul 2004 14:33:11 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040727063311.GL2117@jgomez-p-latitude.asia.unity>
References: <4915A8E67C498D42BAB5CB1351FD026E23CB60@3webad1.3WebMedia.int> <20040727045526.A427320AB@sterenborg.info>
Reply-To: julianjose.gomez@getronics.com
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040727045526.A427320AB@sterenborg.info>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Jul 27, 2004 at 06:55:26AM +0200, Rob Sterenborg spoke thusly:
>> I have several customer FTP sites hosted on ports other than 
>> 21 (ex: 2001, 2002, 2003 and so on)
>>  
>>  
>> Right now, the only way they can work properly is if I open ports
>> 1024 to 8000 for that machines so the ftp return ports are able to
>> connect.
>
>You would need virtual hosting I suppose, this is not a netfilter
>thing.
>
>Reading this, you can not use name-based virtual hosting with ftp :
>http://www.castaglia.org/proftpd/doc/contrib/ProFTPD-mini-HOWTO-Vhost.ht
>ml

If what you want is for conntrack to be able to track ftp data ports,
but where the control channel is not on tcp/21, the modules support
arguments upon loading. `modinfo ip_conntrack_ftp` might help, also
search the mailing list archives.

Its been discussed before, enjoy.

