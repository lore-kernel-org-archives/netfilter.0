From: Michael Gale <michael.gale@utilitran.com>
Subject: FTP passive not working
Date: Tue, 13 Apr 2004 11:41:25 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040413114125.6d159e42@mgalepc.utilitran.com>
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
To: netfilter@lists.netfilter.org

Hello,
	
	I am having trouble getting a FTP connection to work in passive mode from
behind a firewall.

	I on the FTP server I have two IP's one used for internal connections and one
used for external connections. The external one is .36 .. so in the proftpd.conf
file I used the following:

<VirtualHost IP.36>
        ServerName "ftp.domain.com"
        MasqueradeAddress       extip.36       
        IdentLookups            off
        AllowOverwrite                  on
        ExtendedLog /var/log/proftpdvh1.log read,write
        TransferLog   /var/log/proftpdvh1-trans.log
</VirtualHost>

So when I try passive my client tried to connect to the external IP of the
firewall on a port > 1024.

On the firewall ( where I believe the problem is) I have some strange settings.
Since I have a large amount of IP's externally and internally I have done this:

All external IP's are mapped to the corrasponding internal IP. So if externally
I had 192.168.7.36 and internally I had 10.10.1.36

I have: (EXTRANGE.$i is the external IP)

$IPT -N tablerule-$i
$IPT -A INPUT -i $EXT_FACE -d $EXTRANGE.$i -j tablerule-$i
$IPT -A OUTPUT -o $EXT_FACE -s $EXTRANGE.$i -j tablerule-$i
$IPT -A FORWARD -i $EXT_FACE -o $INT_FACE -d $INTRANGE.$i -j tablerule-$i
$IPT -A FORWARD -i $INT_FACE -o $EXT_FACE -s $INTRANGE.$i -j tablerule-$i

So all rules with regards to this IP / PC are under one rule.

This setup is working fine for all connections accept passive FTP -- it seems
the firewall is not forwarding the related data connection to the internal
server.

Oh, I also have PREROUTING rules allowing all connections to .36 to be DNAT to
internal .36 well testing.

-- 
Michael Gale
Network Administrator
Utilitran Corporation

