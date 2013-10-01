From: Bob Miller <bob@computerisms.ca>
Subject: Re: traffic shape per ip
Date: Tue, 01 Oct 2013 09:47:42 -0700
Message-ID: <1380646062.2712.298.camel@worklian>
References: <523B45EA.5090501@gmail.com>
	 <1379622866.3407.93.camel@andylaptop>
	 <CALFTrnNDLHW0NDJVE_sKRjP7DMsnfKXcuiEXado+p6nYUJpUbA@mail.gmail.com>
	 <CALFTrnM6OtNjcuvgm5meyeo_2XEJfQ6qhwrHxtO02bA5tx+cyw@mail.gmail.com>
Reply-To: bob@computerisms.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CALFTrnM6OtNjcuvgm5meyeo_2XEJfQ6qhwrHxtO02bA5tx+cyw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

Perhaps a little late to weigh in, but I found this to be an interesting
thread.  Ray, thanks for sharing your script, I found it an educational
read.  

I have always found it interesting that nobody ever seems to use/mention
tcng to implement the shaping.  I found the learning curve a little
steep because there isn't a lot of examples and documentation, but now
that I have it, shaping is actually very very easy.  This said, I have
never tried to use it to shape traffic on a vpn, but if you are
attaching the vpn to an interface, I don't see why it wouldn't work.  

In case it is useful, I put an example of how to use tcng to limit speed
on a public access network here:

http://cocnm.computerisms.ca/index.php/Shape/Track_Bandwidth_-_Finalize_IPTables



-- 
Computerisms
Bob Miller      
867-334-7117 / 867-633-3760
http://computerisms.ca


On Fri, 2013-09-20 at 09:17 -0400, Ray Soucy wrote:
> Bounced for HTML.  Re-sending as plaintext.
> 
> On Fri, Sep 20, 2013 at 9:15 AM, Ray Soucy <rps@maine.edu> wrote:
> > Try something like this.
> >
> > It's not perfect, but it will work for a pool of up to 8000 IPs (TC limit is
> > 9999 I believe).  Sorry for it being in PHP, it was tossed on a box where
> > everything else is already PHP.
> >
> > Verified to work, and a modest Linux system doesn't have a problem keeping
> > up with it.
> >
> > #!/bin/php
> > <?php
> >
> > $config['wan_if']            = 'eth0';
> > $config['lan_if']            = 'eth1';
> > $config['global_down']       = '300mbit';
> > $config['global_up']         = '300mbit';
> > $config['default_down']      = '1mbit';
> > $config['default_up']        = '1mbit';
> > $config['network_list'] = array('172.19.0.0/20');
> >
> >
> >
> >
> > function cidrtorange($network) {
> >   list($ip, $bits) = explode('/', $network);
> >   $ip = ip2long($ip);
> >   $mask = ~((1 << (32 - $bits)) - 1);
> >   $start = ($ip & $mask) + 1;
> >   $end = ($start - 3) - $mask;
> >   $range = array($start, $end);
> >   return $range;
> > }
> >
> > function exec_cmds($cmd) {
> >   $log_data = "";
> >   $cmd = str_replace('iptables ', '/usr/local/sbin/iptables ', $cmd);
> >   $cmd = str_replace('tc ', '/usr/sbin/tc ', $cmd);
> >   $cmd_list = explode("\n", $cmd);
> >   foreach ($cmd_list as $c) {
> >     if (strlen($c) < 1) continue;
> >     $out = array();
> >     exec($c . ' 2>&1', $out, $status);
> >     if ($status == 0) $log_data .= $c . "\n";
> >     else {
> >       $log_data .= '# FAILED ' . $c . "\n";
> >       foreach ($out as $o) $log_data .= '# ' . $o . "\n";
> >     }
> >   }
> >   echo $log_data;
> > }
> >
> >
> >
> > function do_start() {
> >   global $config;
> >   $host_list = array();
> >   foreach ($config['network_list'] as $network) {
> >     list($start_ip, $end_ip) = cidrtorange($network);
> >     for ($i = $start_ip + 1; $i < $end_ip; $i++) {
> >       $host = long2ip($i);
> >       $host_list[$host]['down'] = $config['default_down'];
> >       $host_list[$host]['up'] = $config['default_up'];
> >     }
> >   }
> >   $cmd = "";
> >   $cmd .= 'iptables -t mangle -N Traffic_Control' . "\n";
> >   $cmd .= 'iptables -t mangle -A PREROUTING -i ' . $config['lan_if'] . ' -j
> > Traffic_Control' . "\n";
> >   $cmd .= 'tc qdisc add dev ' . $config['lan_if'] . ' root handle 1: htb
> > default 9999' . "\n";
> >   $cmd .= 'tc class add dev ' . $config['lan_if'] . ' parent 1: classid
> > 1:9999 htb rate ' . $config['global_down'] . "\n";
> >   $cmd .= 'tc qdisc add dev ' . $config['lan_if'] . ' parent 1:9999 handle
> > 9999: sfq perturb 10' . "\n";
> >   $cmd .= 'tc qdisc add dev ' . $config['wan_if'] . ' root handle 1: htb
> > default 9999' . "\n";
> >   $cmd .= 'tc class add dev ' . $config['wan_if'] . ' parent 1: classid
> > 1:9999 htb rate ' . $config['global_up'] . "\n";
> >   $cmd .= 'tc qdisc add dev ' . $config['wan_if'] . ' parent 1:9999 handle
> > 9999: sfq perturb 10' . "\n";
> >   $tc_index = 1;
> >   foreach ($host_list as $host => $lim) {
> >     $cmd .= 'iptables -t mangle -A Traffic_Control -s ' . $host . ' -j MARK
> > --set-mark ' . $tc_index . "\n";
> >     $cmd .= 'tc class add dev ' . $config['wan_if'] . ' parent 1: classid
> > 1:' . $tc_index . ' htb rate ' . $lim['up'] . "\n";
> >     $cmd .= 'tc filter add dev ' . $config['wan_if'] . ' protocol ip parent
> > 1: prio 1 handle ' . $tc_index . ' fw flowid 1:' . $tc_index . "\n";
> >     $cmd .= 'tc class add dev ' . $config['lan_if'] . ' parent 1: classid
> > 1:' . $tc_index . ' htb rate ' . $lim['down'] . "\n";
> >     $cmd .= 'tc filter add dev ' . $config['lan_if'] . ' protocol ip parent
> > 1: prio 1 u32 match ip dst ' . $host . ' flowid 1:' . $tc_index . "\n";
> >     $tc_index++;
> >   }
> >   exec_cmds($cmd);
> > }
> >
> > function do_stop() {
> >   global $config;
> >   $cmd = "";
> >   $cmd .= 'tc qdisc del dev ' . $config['lan_if'] . ' root' . "\n";
> >   $cmd .= 'tc qdisc del dev ' . $config['wan_if'] . ' root' . "\n";
> >   $cmd .= 'iptables -t mangle -D PREROUTING -i ' . $config['lan_if'] . ' -j
> > Traffic_Control' . "\n";
> >   $cmd .= 'iptables -t mangle -F Traffic_Control' . "\n";
> >   $cmd .= 'iptables -t mangle -X Traffic_Control' . "\n";
> >   exec_cmds($cmd);
> > }
> >
> >
> >
> >
> > if ($argc == 2) {
> >   if ($argv[1] == 'start') {
> >     do_start();
> >   } elseif ($argv[1] == 'stop') {
> >     do_stop();
> >   } elseif ($argv[1] == 'restart') {
> >     do_stop();
> >     do_start();
> >   } else {
> >     echo 'Usage: ' . $argv[0] . ' {start|stop|restart}' . "\n";
> >   }
> >
> > } else {
> >   echo 'Usage: ' . $argv[0] . ' {start|stop|restart}' . "\n";
> > }
> >
> >
> >
> > On Thu, Sep 19, 2013 at 4:34 PM, Andrew Beverley <andy@andybev.com> wrote:
> >>
> >> On Thu, 2013-09-19 at 21:43 +0300, binary wrote:
> >> > i would to limit the bandwidth of some users based on IPs:
> >>
> >> [...]
> >>
> >> This is not as simple as you might think. In order to shape per-IP,
> >> you'll need to set up a class for each individual IP address, and then
> >> filter to that class. I am not aware of a way to write one rule to say
> >> "limit each IP address to this amount".
> >>
> >> Presumably the reason to filter per-IP is to stop single users hogging
> >> the bandwidth. If so, a better approach might be to classify the type of
> >> traffic and then shape on that, or alternatively share bandwidth evenly
> >> per-IP rather than per-connection (as is the default). There is some
> >> information on how to do this on this page at the end of the "downlink"
> >> section:
> >>
> >>
> >> http://www.andybev.com/index.php/Fair_traffic_shaping_an_ADSL_line_for_a_local_network_using_Linux
> >>
> >> If you have any more questions you might want to use the LARTC mailing
> >> list instead of this mailing list.
> >>
> >> Andy
> >>
> >>
> >> --
> >> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> >> the body of a message to majordomo@vger.kernel.org
> >> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> >
> >
> >
> > --
> > Ray Patrick Soucy
> > Network Engineer
> > University of Maine System
> >
> > T: 207-561-3526
> > F: 207-561-3531
> >
> > MaineREN, Maine's Research and Education Network
> > www.maineren.net
> 
> 
> 

