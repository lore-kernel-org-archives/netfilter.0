From: Mike Tone <simpletone@mbox.com.au>
Subject: netfilter log bug - required reboot
Date: Mon, 30 Sep 2002 11:48:59 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <18a265185210.18521018a265@mbox.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
Content-language: en
Content-Disposition: inline
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
To: netfilter@lists.samba.org

after changing the log prefix back to nothing 
(which set it to level 4), the logging didn't 
start again.. 
 
a reboot was required, which set the level back to 
4, and started logging. 
 
is this the 1.2.7 issue?  

---------------------------------------------------------------------
Faxes delivered directly to any email address, new to mBox!
Find out more http://www.mbox.com.au/fax

