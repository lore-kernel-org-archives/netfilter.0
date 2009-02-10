From: Ralf <rm@amitrader.com>
Subject: Re: Error when adding an entry to mangle/PREROUTING
Date: Tue, 10 Feb 2009 10:59:06 +0100
Message-ID: <gmrj5a$i9t$1@ger.gmane.org>
References: <gmq2gg$g63$1@ger.gmane.org> <49909453.18068e0a.3fb8.fffff08f@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49909453.18068e0a.3fb8.fffff08f@mx.google.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Gilad Benjamini wrote:
> Quoting from man iptables: " This  target is only valid in the INPUT,
> FORWARD and OUTPUT chains"
> 
> Since the validation is done by the kernel module, you don't see the error
> message directly, but rather via syslog; e.g. in my case, in
> /var/log/messages you see " kernel: ip_tables: REJECT target: only valid in
> filter table, not mangle"

DROP works, but REJECT does not work.
Maybe it is a bug/oversight, because IMHO I don't see any reason
why REJECT shouldn't be allowed here.


>> -----Original Message-----
>> From: netfilter-owner@vger.kernel.org [mailto:netfilter-
>> owner@vger.kernel.org] On Behalf Of Ralf
>> Sent: Monday, February 09, 2009 12:08 PM
>> To: netfilter@vger.kernel.org
>> Subject: Error when adding an entry to mangle/PREROUTING
>>
>> The following command brings an error ("iptables: Invalid argument"):
>>
>>    $IPTABLES -t mangle -A PREROUTING -p tcp --dport 9999 -j REJECT
>>
>> What's wrong here?

