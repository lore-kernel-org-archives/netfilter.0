From: Leigh Peterson <warpig369@hotmail.com>
Subject: =?windows-1256?Q?RE:_multiple_NIC_traffic_forwarding=FE?=
Date: Tue, 30 Oct 2007 18:23:11 +0000
Message-ID: <BAY119-W266276ED2DC25F6F84D5D7E9920@phx.gbl>
References: <BAY119-W5D1A138C2C78AB9C1390CE9910@phx.gbl>
 <1193664706.18366.6.camel@grateful.d.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1193664706.18366.6.camel@grateful.d.umn.edu>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


> On Mon, 2007-10-29 at 09:08 +0000, Leigh Peterson wrote:
>> Hi All,
>>
>> I have a question regarding iptables traffic forwarding. I have a machine with 2 NICs (which are on different subnets) and all inbound traffic is coming in on eth0.
>>
>> I currently have some rules that accepts traffic on a port range and then forwards that traffic to another host (like this one):
>> -A FORWARD -d 192.168.18.3 -i eth0 -p tcp -m tcp --dport 6660:6669 -j ACCEPT
>> as well as some rules that accept traffic for services on this host (like this):
>> -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 1900 -j ACCEPT
>>
>> My first question is, how can I force the traffic from these two types on rules to respond via eth1?
>
> I believe, though I have never done such a thing, you need to tweak your
> routing tables. Check /sbin/route.

I probably should have made this a little clearer...  Because this machine is going to be a proxy/firewall, I need to forward users requests to eth1 for the servers on that subnet to service the request, hence I'll need to MASQ the connections and do some NATing.  I don't think this will be too difficult, but I'm not sure of the syntax...

>
>>
>> I also have ProxyPass rules in Apache the traffic of which I would also like to forward to eth1.
>
> What interfaces (addresses) is Apache listening to? This last statement
> confuses me...

OK, this part is a little more tricky.  Apache is currently bound to eth0 and services some requests.  This machine also has a few virtual hosts configured and for these hosts, there is an associated ProxyPass rule.  Something like:

ProxyPass        /some_url/   http://some.apache.server:80/

It's this traffic that I will also need to MASQ and redirect out of eth1.  Clear as mud?  If you need any more information, please let me know.

Regards,
Leigh
_________________________________________________________________
The next generation of MSN Hotmail has arrived - Windows Live Hotmail
http://www.newhotmail.co.uk
