From: Michael Gale <mgale@utilitran.com>
Subject: OK dumb questions
Date: Thu, 11 Dec 2003 11:09:04 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031211110904.6e96f533.mgale@utilitran.com>
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

	I have a firewall setup with the default policy to block.

I have a DNAT rule to DNAT incoming connections to a internal IP.
I then have a EXT to INT forward rule for port 80 - state NEW
I then have a EXT to INT forward rule for ESTABLISHED connections
I then have a INT to EXT forward rule for ESTABLISHED connections

This is working great the problem ...

I am not able to get this machine to make a out bound connection :(

I tried enabling logging and nothing ... it is NOT until I change the default policy to ACCEPT that I can make a out bound connection.

The only difference in the log files is that with the default set to ACCEPT it makes it to the NATPOST target ...

The NAT tables have a default of ACCEPT from the beginning


-- 
Michael Gale
Network Administrator
Utilitran Corporation

