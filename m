From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: How iptables know when an UDP connection is closed ?
Date: Thu, 25 Dec 2003 11:27:43 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312251927.hBPJRiTS000145@server5.bandwidthco.com>
References: <1072365326.3873.6.camel@gamux>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1072365326.3873.6.camel@gamux>
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
To: 'Eddahbi Karim' <installation_fault_association@yahoo.fr>, netfilter@lists.netfilter.org

Correct.  The UDP state machine is based on "timers". 

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Eddahbi Karim
Sent: Thursday, December 25, 2003 7:15 AM
To: netfilter@lists.netfilter.org
Subject: How iptables know when an UDP connection is closed ?

Hi,

The question is in the topic, how iptables knows that a UDP connection is
CLOSED ?
Does the connection close only when there's a Timeout ?

--
--
Eddahbi Karim

Phone :
(33) (0)6 61 30 57 77

France




