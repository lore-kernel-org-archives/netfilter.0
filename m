From: "Elison Niven" <Elison.Niven@Matrixtelesol.com>
Subject: Re: iptables resources consumed
Date: Thu, 3 Jul 2008 10:39:04 +0530
Message-ID: <VPOP31.4.0e.20080703103819.796.18.1.00149acd@matrixindia>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

Hi, 

Grant - Thanks a lot for your reply. 

>Question:  What do you want to do with packets that do not match the 
>above rules?
I would just like to discard them.

Yes, I would be using a custom built kernel for PowerPc.
It is now clear that I will have a maximum of 256 (may be 256*2 or 3 !)
rules on eth0 and just 1 rule on eth2.

To make things complex, the PowerPc communicates with the DSPs through
ethernet on eth2.
Each DSP has a control Port number and the PowerPc controls the DSPs through
packets sent at this port number on the DSP. The DSPs respond to these
commands through ethernet packets (that are received on eth2).

Such packets need to be sent to a process on the PowerPc and not forwarded
out on eth0.

The rule on eth2 will be :  If source port of the packet is not a DSP
control Port Number , send the packet out from eth0 and replace source IP
with ip = eth0.

If all the DSPs have different control port numbers that would increase the
checking - Source IP and Source Port per packet, So I prefer to have the
same control port numbers on all the DSPs.

Now If the DSP itself *fakes* the source IP of the packets it generates,
then may be the rule can be simpler : Check the source port of the packet.
If it is not equal to the control port number just send it out *as it is*
from eth0. If source port is equal to the control port number, send it to a
local process.

Please correct me if I am missing something.

>>There will be a lot of traffic flying through this kernel.

Yeah, the mere thought of it puts me in panic! I do not have any prior
experience with iptables. As from your experience, Do you a think a custom
powerc kernel running at 400 MHx,256 MB DDR2 RAM should be able to perform
this task well.

Best Regards,
Elison


