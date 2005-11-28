From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: remove duplicate rules
Date: Mon, 28 Nov 2005 08:19:55 -0500
Message-ID: <1133183995.2605.7.camel@localhost>
References: <6.2.1.2.0.20051126180857.0336a1b0@147.202.41.46>
	<686184511.20051126155508@progtech.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <686184511.20051126155508@progtech.ru>
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
To: "Oleg A. Arkhangelsky" <sysoleg@progtech.ru>
Cc: netfilter@lists.netfilter.org

On Sat, 2005-11-26 at 15:55 +0300, Oleg A. Arkhangelsky wrote:
> Hello amit,
> 
> Saturday, November 26, 2005, 3:39:14 PM, you wrote:
> 
> ap> same iptables.  I want to stop this , if the same rule exists the iptables
> ap> should give some error or should add the same rule again .
> ap> Please help me .
> 
>     I think you should manually check the existence of possible
>     duplicate before adding rule. Also you can do somethig like:
> 
>     iptables -D INPUT -d 192.168.0.2/32 -i eth1 -j DROP
>     iptables -A INPUT -d 192.168.0.2/32 -i eth1 -j DROP
> 
>     Then you will never get duplicates.
>     But the first way is more correct.
> 
Oleg's suggestion seems easiest and wisest.  However, if you absolutely
must check for duplicate rules in an automated way, perhaps you can
adapt this bash scripting snippet that we use in the ISCS network
security management project (http://iscs.sourceforge.net) when we
dynamically alter iptables rules based upon the connecting user's X.509
certificate:

        iptables -n -L VPN_ALLOW > /tmp/iptList
        while read IPs
        do
                if [ "${IPs/" $PLUTO_PEER_CLIENT_NET "/}" != "$IPs" ]
                then
                        echo "X509updown error message: A connection
already exists for $PLUTO_PEER_CLIENT_NET - connection refused" >&2
                        exit $ERRDupIP
                fi
        done < /tmp/iptList
        . $PEPDIR/DNRead A
        if [ "$?" != "0" ]
        then
                echo " DNRead exited abnormally with exit code $?">&2
        fi

It basically dumps the rules of a particular chain to a file, parses the
file line by line and attempts to remove the proposed IP address.  if it
finds a line which does include the IP address (ie., attempting to
remove the IP address actually does change the line), it fails.  Hope
this helps - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


