From: Iulian Mongescu <iulianm@crinsoft.ro>
Subject: CONNMARK problem
Date: Tue, 25 May 2004 16:24:00 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40B348F0.2000700@crinsoft.ro>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------030806000105000806020105"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------030806000105000806020105
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi ,

I am trying to add CONNMARK support  to my kernel , and after 
compilation , the CONNMARK.o module is not made.
This is what I done on my RedHat 9 system:

   1. Get  kernel sources : linux-2.4.26.tar.gz 
   2. Get:  patch-o-matic-ng-20040302.tar.bz2
   3. Apply patch only for CONNMARK ( using  ./runme extra  , and test
      it with   ./runme --test CONNMARK)
          * Already applied:

            Testing CONNMARK... applied

            Excellent! Source trees are ready for compilation.
   4. make menuconfig ,and using the old config ( importing RedHat
      Athlon config)
   5. Selecting (like modules) :
          *   <M>   Connection state match support  
              <M>   Connection mark match support (NEW)
              <M>   Connection tracking match support 
   6. finish to compile without any errors , but  the CONNMARK.o module
      was not build
   7. Trying to figure what went wrong , I  saw that in .config there is
      not set CONFIG_IP_NF_TARGET_CONNMARK , which is required by
      Makefile to build the object :    
      obj-$(CONFIG_IP_NF_TARGET_CONNMARK) += ipt_CONNMARK.o
   8. More, I checked  Config.in file (from netfilter folder) and :
          * if [ "$CONFIG_IP_NF_CONNTRACK_MARK" != "n" ]; then
                  dep_tristate '  Connection mark match support'
            CONFIG_IP_NF_MATCH_CONNMARK $CONFIG_IP_NF_IPTABLES
                fi
          * As you see , it is testing if  $CONFIG_IP_NF_CONNTRACK_MARK
            ( which is not set by anybody , and get true cause is not
            "n" ) and is setting: CONFIG_IP_NF_MATCH_CONNMARK as a
            module in ".config" file .
          * Conclusion the only line in ".config" file regarding
            CONNTRACK is : CONFIG_IP_NF_MATCH_CONNMARK=m  , so normaly
            that make is not building CONNMARK.o
   9. I try to set manually in ".config" those variables, but is not
      working , I get some errors cause CONFIG_IP_NF_CONNTRACK_MARK is
      tested in ip_conntrack.h, and if  it is set manually is not
      exported ...duno why.<><><>

<><>Any help will be appreciated .
Thank you ,
Iulian

      <><> 


--------------030806000105000806020105
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
  <title></title>
</head>
<body bgcolor="#ffffff" text="#000000">
Hi , <br>
<br>
I am trying to add CONNMARK support&nbsp; to my kernel , and after
compilation , the CONNMARK.o module is not made. <br>
This is what I done on my RedHat 9 system:<br>
<ol>
  <li>Get&nbsp; kernel sources : linux-2.4.26.tar.gz&nbsp; <br>
  </li>
  <li>Get:&nbsp; patch-o-matic-ng-20040302.tar.bz2 <br>
  </li>
  <li>Apply patch only for CONNMARK ( using&nbsp; ./runme extra&nbsp; , and test
it with&nbsp;&nbsp; ./runme --test CONNMARK)</li>
  <ul>
    <li>Already applied:<br>
      <br>
Testing CONNMARK... applied<br>
      <br>
Excellent! Source trees are ready for compilation.<br>
    </li>
  </ul>
  <li>make menuconfig ,and using the old config ( importing RedHat
Athlon config)</li>
  <li>Selecting (like modules) : <br>
  </li>
  <ul>
    <li>&nbsp; &lt;M&gt;&nbsp;&nbsp; Connection state match support&nbsp;&nbsp; <br>
&nbsp; &lt;M&gt;&nbsp;&nbsp; Connection mark match support (NEW) <br>
&nbsp; &lt;M&gt;&nbsp;&nbsp; Connection tracking match support&nbsp; <br>
    </li>
  </ul>
  <li>finish to compile without any errors , but&nbsp; the CONNMARK.o module
was not build</li>
  <li>Trying to figure what went wrong , I&nbsp; saw that in .config there
is not set CONFIG_IP_NF_TARGET_CONNMARK , which is required by Makefile
to build the object :&nbsp;&nbsp;&nbsp;&nbsp; obj-$(CONFIG_IP_NF_TARGET_CONNMARK) +=
ipt_CONNMARK.o<br>
  </li>
  <li>More, I checked&nbsp; Config.in file (from netfilter folder) and :</li>
  <ul>
    <li>if [ "$CONFIG_IP_NF_CONNTRACK_MARK" != "n" ]; then<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dep_tristate '&nbsp; Connection mark match support'
CONFIG_IP_NF_MATCH_CONNMARK $CONFIG_IP_NF_IPTABLES<br>
&nbsp;&nbsp;&nbsp; fi</li>
    <li>As you see , it is testing if&nbsp; $CONFIG_IP_NF_CONNTRACK_MARK (
which is not set by anybody , and get true cause is not "n" ) and is
setting: CONFIG_IP_NF_MATCH_CONNMARK as a module in ".config" file . <br>
    </li>
    <li>Conclusion the only line in ".config" file regarding CONNTRACK
is : CONFIG_IP_NF_MATCH_CONNMARK=m&nbsp; , so normaly that make is not
building CONNMARK.o</li>
  </ul>
  <li>I try to set manually in ".config" those variables, but is not
working , I get some errors cause CONFIG_IP_NF_CONNTRACK_MARK is tested
in ip_conntrack.h, and if&nbsp; it is set manually is not exported ...duno
why.<></><><></></></li>
</ol>
<><>Any help will be appreciated .<br>
Thank you , <br>
Iulian<br>
</></>
<ol>
  <><></></>
</ol>
</body>
</html>

--------------030806000105000806020105--

