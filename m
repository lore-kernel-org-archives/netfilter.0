From: Gopal Chandavarapu <Gopal.Chandavarapu@rtc.bosch.com>
Subject: MAC Filtering
Date: Wed, 14 Jan 2004 15:58:12 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4005D794.1080303@rtc.bosch.com>
Reply-To: Gopal.Chandavarapu@rtc.bosch.com
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi All,

A specific hardware and its cross compiler need 2.4.14 version of the 
linux kernel. I have to do MAC filtering for these devices, so I found that

http://ebtables.sourceforge.net/documentation.html#whatdo

  does MAC filtering. -----------   Good till now.



Problem : The problem is ebtables works only with linux kernel 2.4.22/23 
and version 2.6.x

Question 1: Is there any other module like ebtables which does MAC 
filtering and works with 2.4.14 kernel.


Question 2: The MAC filter module should be capable of filtering the 
packets at run time.
That means that the filter should be able to ACCEPT all packets from MAC 
address A for some time and upon users request at run time, it should be 
able to take a new MAC address B and ACCEPT only from B and DROP/ACCEPT 
packets from A.

Please let me know.

Thanks
Gopal.


