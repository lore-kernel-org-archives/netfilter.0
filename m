From: "John L. Magee" <jlmagee@mageenet.net>
Subject: Re: Passive FTP Client fails connecting to Server behind IPTABLES
Date: Tue, 1 Jan 2008 14:46:14 -0500
Message-ID: <91CBD7F22CBCE7458D3E7A71C81B07C8033BBB@mnetmx1.adamapps.host>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Tue, Jan 1, 2008, G.W. Haywood wrote:
>Hi there,
>
>On Sat, 29 Dec 2007, John L. Magee wrote:
>
>> TCPDUMP analysis shows that the response from the server to the
client
>> telling it to go to passive mode on port x is retaining the INSIDE
>> address of the server in the command packet and the client therefore
>> tries to initiate the data connection directly to the inside address
>> instead of the outside one.
>>
>> I do see all kinds of related commentary while googling but none that
>> have any solutions for me. If ip_contrack_ftp and ip_nat_ftp are
>> supposed to manage this, they are not.
>
>Does this help?
>
>http://securepoint.com/lists/html/NetFilter/2006-11/msg00209.html
>
>--
>
>73,
>Ged.
>...

No. It is similar but seems to be the reverse situation.

For a server being accessed by a client with Passive FTP, should
ip_nat_ftp alter the inside address to the outside address when sending
the port for the passive data transfer?

jlm

