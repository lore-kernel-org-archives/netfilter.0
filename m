From: Erik Pagel <erik.pagel@gmx.de>
Subject: Re: Yet another FTP connection problem (Solved)
Date: Fri, 07 Jun 2002 08:32:07 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <426975548.1023438727@[192.168.13.4]>
References: <200206061852.g56Iq2A30805@Networker.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206061852.g56Iq2A30805@Networker.rockstone.co.uk>
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

Hi Antony,

>> ># allow ftp control connections outbound
>> > iptables -A OUTPUT -p tcp --dport 21 -j ACCEPT
>>
>> Why only port 21 and not also port 20 (DATA Channel).
>
> Because the first outbound connection from the client to the server will
> always be a control connection, and then replies for both control and
> data  will be handled as in the ESTABLISHED,RELATED state match.

It looks like iptables didn't like my portrange. If I use only port 21 and 
didn't mention port 20, it's working like a charm.
Maybe this is a point for the ip_nat_ftp/ip_contrack_ftp README.

>
> So did you try them ?   Do they work ?

Yes. Thank you and all other for your help.

>
> Antony.
>
bye Erik


