From: Michael Gale <michael.gale@utilitran.com>
Subject: Re: bandwidth monitoring
Date: Thu, 06 Jan 2005 14:24:15 -0700
Message-ID: <41DDAC7F.5050004@utilitran.com>
References: <200501061128.04741.patrick.leduc@novipro.com>
	<41DD9AE3.4060207@utilitran.com> <41DDA135.5000205@cisco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41DDA135.5000205@cisco.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marek Dohojda <mdohojda@cisco.com>, netfilter@lists.netfilter.org

No problem ...

	I just checked and actually I am using two scripts.

The first script:
--snip-- runntop -- executed by cron.
#!/bin/bash

/usr/bin/curl -k -s -s --digest -u ntopUP:ntopUP 
https://mis.utilitran.com/uploadscripts/ntopget.php > /dev/null

if [ "$?" == "0" ]; then
echo "File loaded" >> /dev/null
else
~/email "Error with NTOP update" netops@utilitran.com < /dev/null
fi

sleep 5

/usr/bin/curl --basic -u admin:ntopadmin 
http://ntop.utilitran.com:3000/ntop/resetStats.html

if [ "$?" == "0" ]; then
echo "File loaded" >> /dev/null
else
~/email "Error with NTOP reset" netops@utilitran.com < /dev/null
fi
--snip--

The first script makes a http request to a php web page that display no 
data. Then once that is successful it makes a http connections to ntop 
and resets the stats.

The second script ... that the first script calls, uses curl to make a 
http connection to the ntop server, download the stats and store them in 
a database. The scripts are kind of messy ... really my first attempt. 
You may notice that data_total is not being used .. that is because I am 
working on storing the total amounts somewhere .. but that is not done.


The second script:
--snip-- ntopget.php -- executed by http request
<?php
//
// The PHP curl module supports the received page to be returned in a 
variable
// if told.
//

$dat=date('m:d:y-U');
$startphp="<?php\n";
$endphp="?>";

echo 'Preparing to download file<BR>';
$fp = fopen('/home/mis/htdocs/datafiles/ntop/data/' . $dat, 'w');
fwrite($fp,$startphp,strlen($startphp));
fclose($fp);

$fp = fopen('/home/mis/htdocs/datafiles/ntop/data/' . $dat, 'a');
$ch = 
curl_init("http://ntop.utilitran.com:3000/ntop/dumpData.html?language=php&view=long");

curl_setopt($ch, CURLOPT_FILE, $fp);
curl_setopt($ch, CURLOPT_HEADER, 0);
curl_exec($ch);
curl_close($ch);

fclose($fp);

$fp = fopen('/home/mis/htdocs/datafiles/ntop/data/' . $dat, 'a');
fwrite($fp,$endphp,strlen($endphp));
fclose($fp);

echo 'Done downloading file<BR>';

include '/home/mis/htdocs/datafiles/ntop/data/' . $dat;

// Start of using array

               $db = mysql_connect("127.0.0.1", "ntop", "ntop") or 
die("Error ... check with network team");
               mysql_select_db("ntop",$db);

foreach ($ntopHash as $key => $value) {

         $addme = strpos($key,"192.168.7");
         $data = array();

         if ( $addme !== FALSE )
         {

array_push($data,$key);
array_push($data,$ntopHash[$key]['hostResolvedName']);
array_push($data,$dat);
array_push($data,$ntopHash[$key]['ethAddressString']);
array_push($data,$ntopHash[$key]['firstSeen']);
array_push($data,$ntopHash[$key]['lastSeen']);
array_push($data,$ntopHash[$key]['averageRcvdThpt']);
array_push($data,$ntopHash[$key]['averageSentThpt']);
array_push($data,$ntopHash[$key]['averageTThpt']);
array_push($data,$ntopHash[$key]['icmpSent']);
array_push($data,$ntopHash[$key]['icmpRcvd']);
array_push($data,$ntopHash[$key]['IP']['FTP']['sendLoc']);
array_push($data,$ntopHash[$key]['IP']['FTP']['rcvdLoc']);
array_push($data,$ntopHash[$key]['IP']['FTP']['sentRem']);
array_push($data,$ntopHash[$key]['IP']['FTP']['rcvdFromRem']);
array_push($data,$ntopHash[$key]['IP']['HTTP']['sentLoc']);
array_push($data,$ntopHash[$key]['IP']['HTTP']['rcvdLoc']);
array_push($data,$ntopHash[$key]['IP']['HTTP']['sentRem']);
array_push($data,$ntopHash[$key]['IP']['HTTP']['rcvdFromRem']);
array_push($data,$ntopHash[$key]['IP']['DIFFHTTP']['sentLoc']);
array_push($data,$ntopHash[$key]['IP']['DIFFHTTP']['rcvdLoc']);
array_push($data,$ntopHash[$key]['IP']['DIFFHTTP']['sentRem']);
array_push($data,$ntopHash[$key]['IP']['DIFFHTTP']['rcvdFromRem']);

array_push($data,$ntopHash[$key]['IP']['RDP']['sentLoc']);
array_push($data,$ntopHash[$key]['IP']['RDP']['rcvdLoc']);
array_push($data,$ntopHash[$key]['IP']['RDP']['sentRem']);
array_push($data,$ntopHash[$key]['IP']['RDP']['rcvdFromRem']);
array_push($data,$ntopHash[$key]['IP']['DNS']['sentLoc']);
array_push($data,$ntopHash[$key]['IP']['DNS']['rcvdLoc']);
array_push($data,$ntopHash[$key]['IP']['DNS']['sentRem']);
array_push($data,$ntopHash[$key]['IP']['DNS']['rcvdFromRem']);
array_push($data,$ntopHash[$key]['IP']['Mail']['sentLoc']);
array_push($data,$ntopHash[$key]['IP']['Mail']['rcvdLoc']);
array_push($data,$ntopHash[$key]['IP']['Mail']['sentRem']);
array_push($data,$ntopHash[$key]['IP']['Mail']['rcvdFromRem']);
array_push($data,$ntopHash[$key]['IP']['DHCP-BOOTP']['sentLoc']);
array_push($data,$ntopHash[$key]['IP']['DHCP-BOOTP']['rcvdLoc']);
array_push($data,$ntopHash[$key]['IP']['DHCP-BOOTP']['sentRem']);
array_push($data,$ntopHash[$key]['IP']['DHCP-BOOTP']['rcvdFromRem']);
array_push($data,$ntopHash[$key]['IP']['SNMP']['sentLoc']);
array_push($data,$ntopHash[$key]['IP']['SNMP']['rcvdLoc']);
array_push($data,$ntopHash[$key]['IP']['SNMP']['sentRem']);
array_push($data,$ntopHash[$key]['IP']['SNMP']['rcvdFromRem']);
array_push($data,$ntopHash[$key]['IP']['NNTP']['sentLoc']);
array_push($data,$ntopHash[$key]['IP']['NNTP']['rcvdLoc']);
array_push($data,$ntopHash[$key]['IP']['NNTP']['sentRem']);
array_push($data,$ntopHash[$key]['IP']['NNTP']['rcvdFromRem']);
array_push($data,$ntopHash[$key]['IP']['SSH']['sentLoc']);
array_push($data,$ntopHash[$key]['IP']['SSH']['rcvdLoc']);
array_push($data,$ntopHash[$key]['IP']['SSH']['sentRem']);
array_push($data,$ntopHash[$key]['IP']['SSH']['rcvdFromRem']);
array_push($data,$ntopHash[$key]['IP']['Messenger']['sentLoc']);
array_push($data,$ntopHash[$key]['IP']['Messenger']['rcvdLoc']);
array_push($data,$ntopHash[$key]['IP']['Messenger']['sentRem']);
array_push($data,$ntopHash[$key]['IP']['Messenger']['rcvdFromRem']);


         foreach ( $data as $key => $value ) {

         $data_table = $data_table . '\'' . $value . '\',';

         }

         for ($i=0;$i<6;$i++) {

         $data_total = $data_total . '\'' . $data_table[$i] . '\',';

         }


         $data_table = substr($data_table,0,(strlen($data_table)-1));
         $data_total = substr($data_total,0,(strlen($data_total)-1));

                 // Here we upload the data into the daily table

                 $sql = "INSERT INTO ntop_daily VALUES ($data_table)";

                 $result = mysql_query($sql) or die("Error ..... check 
with network team " . mysql_error());

                 if ( $result === FALSE )
                 {
                 exec('/home/mis/email "NTOP Nightly Update FAILED" "The 
NTOP nightly update failed" \&/> /dev/null');
                 }

         }
unset($data_table);
unset($data_total);
unset($data);
unset($result);

}

               mysql_close($db);

?>
--snip--




Marek Dohojda wrote:
> Can I see that script?
> 
> 
> 
> 
> 
> ---
> 01001101011000010111001001100101011010110010000001000100010011110110100001101111011010100110010001100001 
> 
> 
> Michael Gale wrote:
> 
>> Hello,
>>
>>     To run NTOP permanitly you just have to clear the stats nightly. I 
>> have a php script that makes a HTTP connection, downloads the stats 
>> from NTOP and saves them in a mysql database. It then makes another 
>> connection and tells NTOP to reset the stats.
>>
>> That keeps the memory and CPU usage low ... so you could run it 
>> continuously.
>>
>> Michael.
>>
>>
>> patrick.leduc@novipro.com wrote:
>>
>>> Hello
>>>
>>> Does somebody know a program for monitoring bandwidth by ip? I have 
>>> one internet interface and I must monitor many ips adresses on this 
>>> interface. I tried Ipac-ng and, I worked a lot to do this config but 
>>> it seems not working this way.
>>>
>>> thanx
>>>
>>

-- 
Michael Gale
Lan Administrator
Utilitran Corp.

I make better friends with those who think for them selves

