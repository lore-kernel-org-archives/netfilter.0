From: Christopher Sagayam <dbadmin@gmail.com>
Subject: Is this mapping possible in netfilter or socks 5 proxy ?
Date: Sun, 20 Feb 2005 15:17:10 +0530
Message-ID: <8c19c242050220014742e91a0c@mail.gmail.com>
Reply-To: Christopher Sagayam <dbadmin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Is this possible using netfilter ?

Can it be a proxy for ssh or sftp too ?

here is the setup that I need:

many client computers C1 to C30 connect to the 
internet using ONE
gateway computer server running socks5 or netfilter proxy S1

client C1 connects to  local LAN Socks/netfilter proxy S1 
and authenticates using
username U1

S1 connects to SSH server external server ES1 
authenticates using
username EU1.

client C1 can transfer files, upload and download 
or do SSH or SFTP to
ES1 now

client C1 has NO knowledge of the usernames and 
passwords needed for
ES1

a mapping file or some mechanism defines to the 
Socks proxy S1 that it
needs to connect to ES1 using username EU1 if a 
client logs into it
using username U1

Is the above possible in socks 5/netfilter or is it 
possible in squid or any
other Linux proxy server for that matter ?

Any help will be greatly appreciated

Thanks

chris

