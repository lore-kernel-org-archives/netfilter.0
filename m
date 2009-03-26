From: Ingmar Schuster <ingmar.schuster@first.fraunhofer.de>
Subject: poll() call gives POLLERR, then hangs
Date: Thu, 26 Mar 2009 13:02:07 +0100
Message-ID: <EE574442-8086-41C7-B537-29681D1EA574@first.fraunhofer.de>
Mime-Version: 1.0 (Apple Message framework v930.3)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: netfilter@vger.kernel.org

Hi all,

in a userspace firewall (using libnetfilter_queue-0.0.17,  
libnfnetlink-0.0.41) I'm writing some strange behavior appeared when  
testing with tcpreplay.
Starting tcpreplay on another computer to replay packets onto the  
firewall, the packets are received in userspace at first. After a  
while the poll() call sets POLLERR in revents, and after a while calls  
to poll() just wont return to the calling function. More exactly, it  
is  __kernel_vsyscall() that doesn't return. Starting netcat in  
parallel to tcpreplay makes poll() on the firewall return.

Does anybody have an idea what's causing this?

Thanks
Ingmar
